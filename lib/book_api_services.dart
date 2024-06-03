import 'dart:convert';

 import 'package:http/http.dart' as http;

import 'book_model_class.dart';
import 'book_second_services.dart';



class BookApiServices {

  Future<BookModel> getData() async {
    var response = await http.get(
        Uri.parse("https://api.itbook.store/1.0/search/mongodb"));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var getBooks = BookModel.fromJson(data);
      print(response);
      return getBooks;
    }
    else {
      return getData();
    }
  }


  Future<BooksDetailsModel> getDetaliesData() async {
    var response = await http.get(
        Uri.parse("https://api.itbook.store/1.0/books/9781617294136"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var bookDetails = BooksDetailsModel.fromJson(
          data); // Assuming your model is correct
      return bookDetails;
    } else {
      throw Exception('Failed to load book details');
    }
  }
//pdf

  Future<BooksDetailsModel> getPdfData() async {
    var response = await http.get(
        Uri.parse("https://itbook.store/files/9781617294136/chapter2.pdf"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var pdf = BooksDetailsModel.fromJson(
          data); // Assuming your model is correct
      return pdf;
    } else {
      throw Exception('Failed to load pdf details');
    }
  }
}