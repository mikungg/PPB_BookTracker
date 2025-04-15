import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import '../models.dart';

class RecentPage extends StatelessWidget {
  final Box<Book> bookBox;
  const RecentPage({super.key, required this.bookBox});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Your Recent Books will be displayed here")),
    );
  }
}
