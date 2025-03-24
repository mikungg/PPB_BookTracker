class ApiDummy {
  List books = [
    {'title': 'Book 1', 'lastPage': 15, 'lastChapter': '1'},
    {'title': 'Book 2', 'lastPage': 56, 'lastChapter': '2'},
    {'title': 'Book 3', 'lastPage': 3, 'lastChapter': '1'},
  ];

  List getBooks() {
    return books;
  }
}
