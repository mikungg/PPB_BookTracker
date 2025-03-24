import 'package:flutter/material.dart';

class RecentPage extends StatelessWidget {
  final List books;
  const RecentPage({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Your Recent Books will be displayed here")),
    );
  }
}
