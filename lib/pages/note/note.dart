import 'dart:convert';
import 'dart:io';

import 'package:amogus/pages/note/note_edit.dart';
import 'package:amogus/pages/note/note_view.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:amogus/ui/right_drawer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  void _loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> noteTitles = prefs.getStringList('noteTitles') ?? [];
    List<String> noteContents = prefs.getStringList('noteContents') ?? [];
    setState(() {
      _notes = List.generate(noteTitles.length, (index) {
        return Note(noteTitles[index], noteContents[index]);
      });
    });
  }

  void _saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> noteTitles = _notes.map((note) => note.title).toList();
    List<String> noteContents = _notes.map((note) => note.content).toList();
    prefs.setStringList('noteTitles', noteTitles);
    prefs.setStringList('noteContents', noteContents);
  }

  void _addNote(String title, String content) {
    setState(() {
      _notes.add(Note(title, content));
      _saveNotes();
    });
  }

  void _removeNote(Note note) {
    setState(() {
      _notes.remove(note);
      _saveNotes();
    });
  }

  void _editNote(Note note) async {
    final updatedNote = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditNote(note: note)),
    );
    if (updatedNote != null) {
      setState(() {
        int index = _notes.indexOf(note);
        _notes[index] = updatedNote;
        _saveNotes();
      });
    }
  }

  void _exportNotes() async {
    // Prompt the user to choose the export location
    final selectedDirectory = await _showDirectoryPicker();
    if (selectedDirectory == null) {
      // User cancelled the directory selection
      return;
    }

    final file = File('$selectedDirectory/notes.json');
    try {
      final jsonNotes = _notes
          .map((note) => {
                'title': note.title,
                'content': note.content,
              })
          .toList();
      await file.writeAsString(jsonEncode(jsonNotes));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Notes exported to $selectedDirectory')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to export notes: $e')),
      );
    }
  }

  Future<String?> _showDirectoryPicker() async {
    final directory = await getApplicationDocumentsDirectory();
    return await FilePicker.platform.getDirectoryPath(
      initialDirectory: directory.path,
      dialogTitle: 'Select export location',
    );
  }

  void _importNotes() async {
    final files = await FilePicker.platform.pickFiles();
    if (files != null) {
      final file = File(files.files.first.path!);
      final fileContent = await file.readAsBytes();
      final jsonNotes = jsonDecode(utf8.decode(fileContent));
      final newNotes = jsonNotes
          .map((note) => Note(note['title'], note['content']))
          .toList()
          .cast<Note>(); // Add this line
      setState(() {
        _notes.addAll(newNotes);
        _saveNotes();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notes imported successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, 'Notes'),
        endDrawer: rightDrawer(context),
        body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            height: 0.5,
            thickness: 0.2,
            color: Colors.blue,
          ),
          itemCount: _notes.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text(_notes[index].title),
                  subtitle: Text(
                    _notes[index].content.length > 200
                        ? '${_notes[index].content.substring(0, 100)}...'
                        : _notes[index].content,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewNote(note: _notes[index]),
                      ),
                    );
                  },
                  onLongPress: () {
                    _editNote(_notes[index]);
                  },
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          _editNote(_notes[index]);
                        },
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _removeNote(_notes[index]);
                        },
                      ),
                    ],
                  ),
                ),
                if (index < _notes.length - 1)
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
              ],
            );
          },
        ),
        floatingActionButton: Stack(
          children: [
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddNote()),
                  ).then((note) {
                    if (note != null) {
                      _addNote(note.title, note.content);
                    }
                  });
                },
                tooltip: 'Add Note',
                child: const Icon(Icons.add),
              ),
            ),
            Positioned(
              bottom: 80,
              right: 16,
              child: FloatingActionButton(
                onPressed: _importNotes,
                tooltip: 'Import Notes',
                child: const Icon(Icons.cloud_download),
              ),
            ),
            Positioned(
              bottom: 144,
              right: 16,
              child: FloatingActionButton(
                onPressed: _exportNotes,
                tooltip: 'Export Notes',
                child: const Icon(Icons.cloud_upload),
              ),
            ),
          ],
        ));
  }
}

class Note {
  String title;
  String content;

  Note(this.title, this.content);
}

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) => _title = value!,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 500,
                child: TextFormField(
                  maxLines: null,
                  expands: true,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    labelText: 'Content',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some content';
                    }
                    return null;
                  },
                  onSaved: (value) => _content = value!,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context, Note(_title, _content));
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
