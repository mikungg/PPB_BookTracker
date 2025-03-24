class ApiDummy {
  List books = [
    {'title': 'Book 1', 'lastPage': 15, 'lastChapter': 'Chapter 1'},
    {'title': 'Book 2', 'lastPage': 56, 'lastChapter': 'Chapter 2'},
    {'title': 'Book 3', 'lastPage': 3, 'lastChapter': 'Chapter 1'},
  ];

  List getBooks() {
    return books;
  }
}
