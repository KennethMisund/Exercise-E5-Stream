import 'package:exercise_e5/infrastructure/book.dart';
import 'package:exercise_e5/infrastructure/book_repository.dart';
import 'package:exercise_e5/infrastructure/sleep.dart';

// Part 1 of the Exercise
Future<void> longOperation() async {
  return sleepSeconds(3);
}

Future<void> sleepMilliseconds(int milli) async {
  return Future.delayed(Duration(milliseconds: milli));
}

Future<int> readTemperature() async {
  return sleepMilliseconds(200).then((value) => 23);
}

// Part 2 of the Exercise

class BookService {
  static BookService _instance = BookService._();

  static BookService getInstance() {
    return _instance;
  }

  BookService._();


  Stream<Book> getBooks() {
    return BookRepository.getInstance().fetchAllBooks();
  }

  Stream<String> getAllTitles() {
    return getBooks().map((book) => book.title);
  }

  Stream<Book> searchByTitle(String searchString) {
    return getBooks().where((Book book) => book.title.contains(searchString));
  }

}
