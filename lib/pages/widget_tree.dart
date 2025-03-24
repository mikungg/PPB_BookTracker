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
        onPressed: () {
          setState(() {
            books.add({
              'title': 'Book ${books.length + 1}',
              'lastPage': 0,
              'lastChapter': 'Chapter 1',
            });
          });
        },
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
}
