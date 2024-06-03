
import 'package:flutter/material.dart';
import 'api_class_page.dart';
import 'book_api_services.dart';
import 'book_detiles_page.dart';
import 'book_model_class.dart';

class BookViewScreen extends StatefulWidget {
  const BookViewScreen({Key? key}) : super(key: key);

  @override
  State<BookViewScreen> createState() => _BookViewScreenState();
}

class _BookViewScreenState extends State<BookViewScreen> {
  List<Book>? booksData;
  List<Book>? value = [];

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    final BookModel data = await BookApiServices().getData();
    setState(() {
      booksData = data.books;
      value = booksData;
    });
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        value = booksData;
      });
    } else {
      setState(() {
        value = booksData!
            .where((book) => book.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        actions:  [
          // Padding(
          //     padding: EdgeInsets.only(right: 30),
          //     child: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(
          //       builder: (context) => const PdfViewData(),));}, icon: const Icon(Icons.east_sharp,color: Colors.white,))
          // )
        ],
        title: const Text(
          "Book Data View",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.teal,
      ),
      body: RefreshIndicator(
        onRefresh: fetchBooks,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: filterSearchResults,
                decoration: const InputDecoration(
                  labelText: 'Search',
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value?.length ?? 0,
                itemBuilder: (context, index) {
                  final Book? book = value?[index];
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetaliesView(book: book),
                          ),
                        );
                      },
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
                                fontSize: 18),
                          ),
                          subtitle: Text(
                            "${book?.subtitle}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}