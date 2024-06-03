// // var BASE_URL = "https://api.itbook.store/1.0/search/mongodb";
// // var bookEndPoint = "new";
// // var searchEndPoint = "search";
// // // var book = "9781617294136";
// //
//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'book_detail_model.dart';
// import 'book_model_class.dart';
//
// class BookApiServices {
//
//   Future<BookModel> getBookData() async {
//     // var headers = {
//     //   "Authorization": 'Basic ${base64Encode(utf8.encode('${'rzp_test_fDHQt7hg7IlYBv'}:${'SzSUd2fe3n5NO8KragWwfKsc'}'))}'
//     // };
//
//     var response = await http.get(
//         Uri.parse("https://api.itbook.store/1.0/search/mongodb"));
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       var getBooks = BookModel.fromJson(data);
//       print(response);
//       return getBooks;
//     }
//     else {
//       return getBookData();
//     }
//   }
//
//
//   Future<BooksDetailsModel> getDetaliesData() async {
//     var response = await http.get(
//         Uri.parse("https://api.itbook.store/1.0/books/9781617294136"));
//
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       var bookDetails = BooksDetailsModel.fromJson(
//           data); // Assuming your model is correct
//       return bookDetails;
//     } else {
//       throw Exception('Failed to load book details');
//     }
//   }
// }
//
// //   Future getPdfData() async {
// //
// //     var response = await http.get(Uri.parse("https://itbook.store/files/9781617294136/chapter2.pdf"));
// //
// //     if (response.statusCode == 200) {
// //       var data = json.decode(response.body);
// //       var pdf = BooksDetailsModel.fromJson(data); // Assuming your model is correct
// //       return pdf;
// //     } else {
// //       throw Exception('Failed to load pdf details');
// //     }
// //   }
