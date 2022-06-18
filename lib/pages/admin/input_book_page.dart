import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

class InputBook extends StatefulWidget {
  static const ROUTE_NAME = '/input_book';
  const InputBook({Key? key}) : super(key: key);

  @override
  _InputBookState createState() => _InputBookState();
}

class _InputBookState extends State<InputBook> {
  final TextEditingController _bookAuthorController = TextEditingController();
  final TextEditingController _bookLocationController = TextEditingController();
  final TextEditingController _bookTitleController = TextEditingController();
  final TextEditingController _bookUrlController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  // bool or false
  // final TextEditingController _isBookedController = TextEditingController();
  bool _isAvailable = false;

  final TextEditingController _publisherController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _synopsisController = TextEditingController();

  final CollectionReference _books = FirebaseFirestore.instance.collection('Book');

  late bool status;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: accentColor,
        ),
        textTheme: myTextTheme,
      ),
      home: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          foregroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: accentColor,
              size: 25,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Tambah Buku',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: accentColor, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue.withOpacity(0),
          elevation: 0.0,
        ),
        body: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.symmetric(vertical: 4),
          height: size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(2, 3),
              ),
            ],
          ),
          child: Form(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _idController,

                        decoration: InputDecoration(
                          labelText: "ID Buku",
                          icon: const Icon(Icons.numbers),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _bookTitleController,

                        decoration: InputDecoration(
                          labelText: "Judul Buku",
                          icon: const Icon(Icons.book),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _ratingController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),

                        decoration: InputDecoration(
                          labelText: "Rating Buku",
                          icon: const Icon(Icons.star_border),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _bookUrlController,

                        decoration: InputDecoration(
                          labelText: "URL Buku",
                          icon: const Icon(Icons.link),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _bookAuthorController,

                        decoration: InputDecoration(
                          labelText: "Author",
                          icon: const Icon(Icons.people),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _publisherController,

                        decoration: InputDecoration(
                          labelText: "Penerbit Buku",
                          icon: const Icon(Icons.published_with_changes),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _bookLocationController,

                        decoration: InputDecoration(
                          labelText: "Letak Buku",
                          icon: const Icon(Icons.library_books_sharp),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _synopsisController,

                        decoration: InputDecoration(
                          labelText: "Sinopsis",
                          icon: const Icon(Icons.library_books_sharp),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),

                    SwitchListTile(
                      title: Text('Status : ${_status(status)}'),
                      value: status,
                      activeColor: secdarkColor,
                      onChanged: (value) {
                        setState(() {
                          _isAvailable = value;
                        });
                      },
                    ),

                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: secdarkColor,
                        padding: const EdgeInsets.all(7),
                      ),
                      onPressed: () {
                        final String id = _idController.text;
                        final String bookTitle = _bookTitleController.text;
                        final double? rating = double.tryParse(_ratingController.text);
                        final String bookUrl = _bookUrlController.text;
                        final String author = _bookAuthorController.text;
                        final String publisher = _publisherController.text;
                        final String bookLocation = _bookLocationController.text;
                        final String synopsis = _synopsisController.text;
                        final bool isBooked = _isAvailable;

                        _books.add({
                          "id" : id,
                          "bookTitle": bookTitle,
                          "rating": rating,
                          "bookUrl": bookUrl,
                          "bookAuthor": author,
                          "publisher": publisher,
                          "bookLocation": bookLocation,
                          "synopsis": synopsis,
                          "isBooked": isBooked
                        });

                        _idController.text = "";
                        _bookTitleController.text = "";
                        _ratingController.text = "";
                        _bookUrlController.text = "";
                        _bookAuthorController.text = "";
                        _publisherController.text = "";
                        _bookLocationController.text = "";
                        _synopsisController.text = "";
                        _isAvailable = false;

                      },
                      icon: const Icon(
                        Icons.save_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      label: Text(
                        'Simpan',
                        style: Theme.of(context).textTheme.button?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ),
          )
        ),
    );
  }

  String _status(bool value) {
    return value == true ? 'Tersedia' : 'Tidak tersedia';
  }
}