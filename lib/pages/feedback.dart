import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  String _feedback = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Please let us know what you think of the app.',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              feedBackForm(),
            ],
          ),
        ),
      ),
    );
  }

  Column feedBackForm() {
    return Column(
      children: [
        TextFormField(
          maxLines: 1,
          decoration: const InputDecoration(
            labelText: 'Your email',
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            border: InputBorder.none,
            filled: true,
            fillColor: Color.fromARGB(255, 232, 244, 217),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
          onSaved: (value) => _email = value!,
        ),
        const SizedBox(height: 20),
        TextFormField(
          maxLines: 10,
          decoration: const InputDecoration(
            labelText: 'Your Feedback',
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            alignLabelWithHint: true,
            border: InputBorder.none,
            filled: true,
            fillColor: Color.fromARGB(255, 232, 244, 217),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your feedback';
            }
            return null;
          },
          onSaved: (value) => _feedback = value!,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              try {
                final FirebaseFirestore _firestore = FirebaseFirestore.instance;
                await _firestore.collection('feedback').add({
                  'email': _email,
                  'feedback': _feedback,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Feedback sent successfully'),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error sending feedback: $e'),
                  ),
                );
              }
            }
          },
          child: const Text('Submit'),
        ),
        const SizedBox(height: 20),
        const Text(
          '*We will use your words to track you down and then break into your home and eat your fridge lmao and no one can stop us, yes, not even ourself!!!',
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey, // Grey color to indicate it's a disclaimer
            fontStyle: FontStyle.italic, // Italic font to make it stand out
          ),
        ),
      ],
    );
  }
}
