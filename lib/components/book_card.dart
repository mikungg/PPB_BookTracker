import 'package:flutter/material.dart';

class BooksCard extends StatelessWidget {
  final String title;
  final String lastChapter;
  final int lastPage;
  final VoidCallback delete;
  BooksCard({
    required this.title,
    required this.lastChapter,
    required this.lastPage,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
            ),
            SizedBox(height: 6.0),
            Text(
              lastChapter + ', Page ' + lastPage.toString(),
              style: TextStyle(fontSize: 14.0, color: Colors.grey[800]),
            ),
            SizedBox(height: 8.0),
            TextButton.icon(
              onPressed: delete,
              label: Text('delete book'),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
