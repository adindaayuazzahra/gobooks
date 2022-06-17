import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // final TextEditingController _bookTitle = TextEditingController();
  // final TextEditingController _bookAuthors = TextEditingController();

  final CollectionReference _books = FirebaseFirestore.instance.collection('Book');

  // Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
  //
  //   await showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (BuildContext ctx) {
  //         return Padding(
  //           padding: EdgeInsets.only(
  //               top: 20,
  //               left: 20,
  //               right: 20,
  //               bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               TextField(
  //                 controller: _nameController,
  //                 decoration: const InputDecoration(labelText: 'Name'),
  //               ),
  //               TextField(
  //                 keyboardType:
  //                 const TextInputType.numberWithOptions(decimal: true),
  //                 controller: _priceController,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Price',
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               ElevatedButton(
  //                 child: const Text('Create'),
  //                 onPressed: () async {
  //                   final String name = _nameController.text;
  //                   final double? price =
  //                   double.tryParse(_priceController.text);
  //                   if (price != null) {
  //                     await _products.add({"name": name, "price": price});
  //
  //                     _nameController.text = '';
  //                     _priceController.text = '';
  //                     Navigator.of(context).pop();
  //                   }
  //                 },
  //               )
  //             ],
  //           ),
  //         );
  //
  //       });
  // }

  // Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
  //   if (documentSnapshot != null) {
  //
  //     _nameController.text = documentSnapshot['name'];
  //     _priceController.text = documentSnapshot['price'].toString();
  //   }
  //
  //   await showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (BuildContext ctx) {
  //         return Padding(
  //           padding: EdgeInsets.only(
  //               top: 20,
  //               left: 20,
  //               right: 20,
  //               bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               TextField(
  //                 controller: _nameController,
  //                 decoration: const InputDecoration(labelText: 'Name'),
  //               ),
  //               TextField(
  //                 keyboardType:
  //                 const TextInputType.numberWithOptions(decimal: true),
  //                 controller: _priceController,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Price',
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               ElevatedButton(
  //                 child: const Text( 'Update'),
  //                 onPressed: () async {
  //                   final String name = _nameController.text;
  //                   final double? price =
  //                   double.tryParse(_priceController.text);
  //                   if (price != null) {
  //
  //                     await _products
  //                         .doc(documentSnapshot!.id)
  //                         .update({"name": name, "price": price});
  //                     _nameController.text = '';
  //                     _priceController.text = '';
  //                     Navigator.of(context).pop();
  //                   }
  //                 },
  //               )
  //             ],
  //           ),
  //         );
  //       });
  // }

  // Future<void> _delete(String productId) async {
  //   await _products.doc(productId).delete();
  //
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text('You have successfully deleted a product')));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Firebase Firestore')),
        ),
        body: StreamBuilder(
          stream: _books.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                  streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(documentSnapshot['bookTitle']),
                      subtitle: Text(documentSnapshot['bookAuthor'].toString()),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),

        // Add new product
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => _create(),
        //   child: const Icon(Icons.add),
        //
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}