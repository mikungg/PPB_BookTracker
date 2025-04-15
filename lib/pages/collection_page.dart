import 'package:app_assignment_crud/components/book_card.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import '../models.dart';

class ColletionPage extends StatefulWidget {
  final Box<Book> bookBox;

  const ColletionPage({super.key, required this.bookBox});

  @override
  State<ColletionPage> createState() => _ColletionPageState();
}

class _ColletionPageState extends State<ColletionPage> {
  late List<Book> books; // ObjectBox data

  @override
  void initState() {
    super.initState();
    books = widget.bookBox.getAll(); // load books from ObjectBox
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          books.isEmpty
              ? Center(child: Text("No books yet."))
              : SingleChildScrollView(
                child: Column(
                  children:
                      books.map((book) {
                        return BooksCard(
                          title: book.title,
                          lastChapter: book.lastChapter,
                          lastPage: book.lastPage,
                          delete: () => deleteBook(book),
                          edit: () => editBook(book),
                        );
                      }).toList(),
                ),
              ),
    );
  }

  void deleteBook(Book book) {
    setState(() {
      widget.bookBox.remove(book.id); // delete from ObjectBox
      books.remove(book); // update local state
    });
  }

  void editBook(Book book) {
    final titleController = TextEditingController(text: book.title);
    final lastChapterController = TextEditingController(text: book.lastChapter);
    final lastPageController = TextEditingController(
      text: book.lastPage.toString(),
    );

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
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
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    book.title = titleController.text;
                    book.lastChapter = lastChapterController.text;
                    book.lastPage = int.parse(lastPageController.text);
                    widget.bookBox.put(book); // update ObjectBox
                  });
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          ),
    );
  }
}
