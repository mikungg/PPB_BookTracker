import 'package:app_assignment_crud/components/book_card.dart';
import 'package:flutter/material.dart';

class ColletionPage extends StatefulWidget {
  final List books;
  const ColletionPage({super.key, required this.books});

  @override
  State<ColletionPage> createState() => _ColletionPageState();
}

class _ColletionPageState extends State<ColletionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:
              widget.books
                  .map(
                    (book) => BooksCard(
                      title: book['title'],
                      lastChapter: book['lastChapter'],
                      lastPage: book['lastPage'],
                      delete: () {
                        setState(() {
                          widget.books.remove(book);
                        });
                      },
                      edit: () {
                        editBook(book);
                      },
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }

  void editBook(Map book) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController titleController = TextEditingController(
          text: book['title'],
        );
        final TextEditingController lastChapterController =
            TextEditingController(text: book['lastChapter']);
        final TextEditingController lastPageController = TextEditingController(
          text: book['lastPage'].toString(),
        );

        return AlertDialog(
          title: Text('Edit Book'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: lastChapterController,
                decoration: InputDecoration(labelText: 'Last Chapter'),
              ),
              TextField(
                controller: lastPageController,
                decoration: InputDecoration(labelText: 'Last Page'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  book['title'] = titleController.text;
                  book['lastChapter'] = lastChapterController.text;
                  book['lastPage'] = int.parse(lastPageController.text);
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
