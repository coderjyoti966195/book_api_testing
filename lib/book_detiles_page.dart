
import 'package:flutter/material.dart';

import 'api_class_page.dart';
import 'book_api_services.dart';
import 'book_model_class.dart';
import 'book_second_services.dart';

class BookDetaliesView extends StatefulWidget {
  const BookDetaliesView({Key? key, required this.book}) : super(key: key);

  final Book? book; // Change String? to Book?

  @override
  State<BookDetaliesView> createState() => _BookDetaliesViewState();
}

class _BookDetaliesViewState extends State<BookDetaliesView> {
  late Future<BooksDetailsModel> _bookDetailsFuture;

  @override
  void initState() {
    super.initState();
    _bookDetailsFuture = BookApiServices().getDetaliesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Book Details View",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: RefreshIndicator(
        child: FutureBuilder<BooksDetailsModel>(
          future: _bookDetailsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else {
              var book = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  elevation: 5,
                  color: Colors.teal,
                  shadowColor: Colors.black,
                  child: ListTile(
                    leading: Image.network("${book?.image}"),
                    title: Text(
                      "${book?.title}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      "${book?.subtitle}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            }
          },
        ),
        onRefresh: () async {
          setState(() {
            _bookDetailsFuture = BookApiServices().getDetaliesData();
          });
        },
      ),
    );
  }
}