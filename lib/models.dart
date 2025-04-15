import 'package:objectbox/objectbox.dart';

@Entity()
class Book {
  int id = 0;

  String title;
  int lastPage;
  String lastChapter;

  Book({
    this.id = 0,
    required this.title,
    required this.lastPage,
    required this.lastChapter,
  });
}
