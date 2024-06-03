import 'package:flutter/material.dart';
import 'book_api_services.dart';
class ViewBookDetails extends StatelessWidget {
  const ViewBookDetails({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Details"),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder(
        future: BookApiServices().getPdfData(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data != null) {
            return Center(
              child: Column(
                children: [
                  Image.network("${data.image}"),
                  Text("TITLE:- ${data.title}",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("SUBTITLE:- ${data.subtitle}"),
                  Text("AUTHORS:- ${data.authors}"),
                  Text("Language:- ${data.language}"),
                  Text("ISBN10:- ${data.isbn10}"),
                  Text("ISBN13:- ${data.isbn13}"),
                  Text("PAGES:- ${data.pages}"),
                  Text("PAGES:- ${data.pages}"),
                  Text("YEAR:- ${data.year}"),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}