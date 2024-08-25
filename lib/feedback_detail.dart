import 'package:amogus/ui/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedbackDetailPage extends StatefulWidget {
  final DocumentSnapshot document;

  FeedbackDetailPage({required this.document});

  @override
  _FeedbackDetailPageState createState() => _FeedbackDetailPageState();
}

class _FeedbackDetailPageState extends State<FeedbackDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Feedback Detail'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(widget.document['email']),
            SizedBox(height: 20),
            Text(widget.document['feedback']),
          ],
        ),
      ),
    );
  }
}
