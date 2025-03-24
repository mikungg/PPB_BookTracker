import 'package:flutter/material.dart';

class BooksCard extends StatelessWidget {
  final String title;
  final String lastChapter;
  final int lastPage;
  final VoidCallback delete;
  final VoidCallback edit;
  BooksCard({
    required this.title,
    required this.lastChapter,
    required this.lastPage,
    required this.delete,
    required this.edit,
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
              'Chapter ' + lastChapter + ', Page ' + lastPage.toString(),
              style: TextStyle(fontSize: 14.0, color: Colors.grey[800]),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: edit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    fixedSize: Size(110, 40),
                  ),
                  label: Text('Edit', style: TextStyle(color: Colors.white)),
                  icon: Icon(Icons.edit, color: Colors.white),
                ),
                ElevatedButton.icon(
                  onPressed: delete,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: Size(110, 40),
                  ),
                  label: Text('Delete', style: TextStyle(color: Colors.white)),
                  icon: Icon(Icons.delete, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
