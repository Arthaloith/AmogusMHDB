import 'package:amogus/feedback_detail.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/theme_provider.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
        appBar: customAppBar(context, 'Feedback List'),
        body: Theme(
          data: themeProvider.theme,
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('feedback').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = snapshot.data!.docs[index];
                  return ListTile(
                    title: Text(document['email']),
                    subtitle: Text(document['feedback']),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                FeedbackDetailPage(document: document)),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      );
    });
  }
}
