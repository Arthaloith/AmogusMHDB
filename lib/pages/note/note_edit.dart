import 'package:amogus/pages/note/note.dart';
import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {
  final Note note;

  const EditNote({super.key, required this.note});

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _content;

  @override
  void initState() {
    super.initState();
    _title = widget.note.title;
    _content = widget.note.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
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
                height: 500, // Increase the height of the content field
                child: TextFormField(
                  initialValue: _content,
                  maxLines: null, // Allow unlimited number of lines
                  expands: true, // Expand the field to fill the available space
                  textAlign: TextAlign.start, // Align the text to the top
                  textAlignVertical:
                      TextAlignVertical.top, // Align the text to the top
                  decoration: const InputDecoration(
                    labelText: 'Content',
                    border: OutlineInputBorder(), // Add a border to the field
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
                    Note updatedNote = Note(_title, _content);
                    Navigator.pop(context, updatedNote);
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
