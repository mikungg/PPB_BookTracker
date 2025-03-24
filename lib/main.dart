import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Book Tracker'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Center(
          child: Text("Recent Books")
        ),
        drawer: SafeArea(
          child: Drawer()
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blueAccent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.history), 
              label: 'Recent'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'My Collections',
            ),
          ],
        ),
      ),
    );
  }
}
