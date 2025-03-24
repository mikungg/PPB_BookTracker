import 'package:app_assignment_crud/api/api_dummy.dart';
import 'package:app_assignment_crud/pages/collection_page.dart';
import 'package:app_assignment_crud/pages/recent_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int myIndex = 0;

  List books = ApiDummy().getBooks();
  late List pages;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController lastChapterController = TextEditingController();
  final TextEditingController lastPageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    pages = [ColletionPage(books: books), RecentPage(books: books)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Book Tracker'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: pages[myIndex],
      drawer: SafeArea(child: Drawer()),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        splashColor: Colors.blueAccent,
        onPressed: addBook,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        selectedItemColor: Colors.blueAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Collections',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Recent'),
        ],
      ),
    );
  }

  void addBook() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Book'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(hintText: 'Title'),
              ),
              TextField(
                controller: lastChapterController,
                decoration: InputDecoration(hintText: 'Last Chapter'),
              ),
              TextField(
                controller: lastPageController,
                decoration: InputDecoration(hintText: 'Last Page'),
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
                  books.add({
                    'title': titleController.text,
                    'lastChapter': lastChapterController.text,
                    'lastPage': int.parse(lastPageController.text),
                  });
                });
                titleController.clear();
                lastChapterController.clear();
                lastPageController.clear();
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
