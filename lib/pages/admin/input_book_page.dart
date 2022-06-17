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
  final TextEditingController _isBookedController = TextEditingController();

  final TextEditingController _publisherController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _releaseDateController = TextEditingController();
  final TextEditingController _synopsisController = TextEditingController();

  final CollectionReference _books = FirebaseFirestore.instance.collection('Book');

  DateTime? selectedDate;
  bool status = false;

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
                        validator: (value) {
                          if (value == null) {
                            return 'Judul Tidak boleh kosong';
                          }
                          return null;
                        },
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

// Hanya jam
// DateTimeFormField(
//   decoration: const InputDecoration(
//     hintStyle: TextStyle(color: Colors.black45),
//     errorStyle: TextStyle(color: Colors.redAccent),
//     border: OutlineInputBorder(),
//     suffixIcon: Icon(Icons.event_note),
//     labelText: 'Only time',
//   ),
//   mode: DateTimeFieldPickerMode.time,
//   autovalidateMode: AutovalidateMode.always,
//   validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
//   onDateSelected: (DateTime value) {
//     print(value);
//   },
// ),

// Tanggal dan waktu
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: DateTimeField(
//       decoration: InputDecoration(
//         icon: const Icon(Icons.date_range),
//         hintText: 'Tanggal',
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5.0)),
//       ),
//       selectedDate: selectedDate,
//       onDateSelected: (DateTime value) {
//         setState(() {
//           selectedDate = value;
//         });
//       }),
// ),

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

                        _books.add({
                          "id" : id,
                          "bookTitle": bookTitle,
                          "rating": rating,
                          "bookUrl": bookUrl,
                          "bookAuthor": author,
                          "publisher": publisher,
                          "bookLocation": bookLocation,
                          "synopsis": synopsis
                        });

                        _idController.text = "";
                        _bookTitleController.text = "";
                        _ratingController.text = "";
                        _bookUrlController.text = "";
                        _bookAuthorController.text = "";
                        _publisherController.text = "";
                        _bookLocationController.text = "";
                        _synopsisController.text = "";

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

//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//
//   final CollectionReference _products = FirebaseFirestore.instance.collection('Book');
//
//   Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
//
//     await showModalBottomSheet(
//         isScrollControlled: true,
//         context: context,
//         builder: (BuildContext ctx) {
//           return Padding(
//             padding: EdgeInsets.only(
//                 top: 20,
//                 left: 20,
//                 right: 20,
//                 bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(labelText: 'Name'),
//                 ),
//                 TextField(
//                   keyboardType:
//                   const TextInputType.numberWithOptions(decimal: true),
//                   controller: _priceController,
//                   decoration: const InputDecoration(
//                     labelText: 'Price',
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton(
//                   child: const Text('Create'),
//                   onPressed: () async {
//                     final String name = _nameController.text;
//                     final double? price =
//                     double.tryParse(_priceController.text);
//                     if (price != null) {
//                       await _products.add({"name": name, "price": price});
//
//                       _nameController.text = '';
//                       _priceController.text = '';
//                       Navigator.of(context).pop();
//                     }
//                   },
//                 )
//               ],
//             ),
//           );
//
//         });
//   }
//
//   Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
//     if (documentSnapshot != null) {
//
//       _nameController.text = documentSnapshot['name'];
//       _priceController.text = documentSnapshot['price'].toString();
//     }
//
//     await showModalBottomSheet(
//         isScrollControlled: true,
//         context: context,
//         builder: (BuildContext ctx) {
//           return Padding(
//             padding: EdgeInsets.only(
//                 top: 20,
//                 left: 20,
//                 right: 20,
//                 bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(labelText: 'Name'),
//                 ),
//                 TextField(
//                   keyboardType:
//                   const TextInputType.numberWithOptions(decimal: true),
//                   controller: _priceController,
//                   decoration: const InputDecoration(
//                     labelText: 'Price',
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton(
//                   child: const Text( 'Update'),
//                   onPressed: () async {
//                     final String name = _nameController.text;
//                     final double? price =
//                     double.tryParse(_priceController.text);
//                     if (price != null) {
//
//                       await _products
//                           .doc(documentSnapshot!.id)
//                           .update({"name": name, "price": price});
//                       _nameController.text = '';
//                       _priceController.text = '';
//                       Navigator.of(context).pop();
//                     }
//                   },
//                 )
//               ],
//             ),
//           );
//         });
//   }
//
//   Future<void> _delete(String productId) async {
//     await _products.doc(productId).delete();
//
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('You have successfully deleted a product')));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text('Firebase Firestore')),
//       ),
//       body: StreamBuilder(
//         stream: _products.snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//           if (streamSnapshot.hasData) {
//             return ListView.builder(
//               itemCount: streamSnapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 final DocumentSnapshot documentSnapshot =
//                 streamSnapshot.data!.docs[index];
//                 return Card(
//                   margin: const EdgeInsets.all(10),
//                   child: ListTile(
//                     title: Text(documentSnapshot['bookTitle']),
//                     subtitle: Text(documentSnapshot['bookAuthor'].toString()),
//                   ),
//                 );
//               },
//             );
//           }
//
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//
//       // Add new product
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () => _create(),
//       //   child: const Icon(Icons.add),
//       //
//       // ),
//       // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
//     );
//   }
// }