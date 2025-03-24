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
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
