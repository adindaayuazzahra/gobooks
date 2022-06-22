import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';
import 'package:gobooks/pages/admin/main_page_admin.dart';
import 'package:gobooks/widgets/booking_list.dart';

import '../../widgets/history_bookmark_list.dart';

class BookingPage extends StatefulWidget {
  static const routeName = '/booking_list';
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final CollectionReference _books =
      FirebaseFirestore.instance.collection('Book');

  String queries = '';
  final TextEditingController _searchControl = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          color: Colors.black,
          onPressed: _openDrawer,
        ),
        title: Text(
          'Dashboard',
          style: Theme.of(context).textTheme.headline6?.copyWith(
              color: accentColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.search_rounded,
                      color: secdarkColor,
                    ),
                    hintText: "Cari id Buku",
                    border: InputBorder.none,
                  ),
                  onChanged: (String value) {},
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.7,
              child: StreamBuilder(
                stream: _books.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          child: BookingList(
                            onTap: () {},
                            documentSnapshot: documentSnapshot,
                            // imageUrl: documentSnapshot['bookUrl'],
                            // bookTitle: documentSnapshot['bookTitle'],
                            // bookLocation: documentSnapshot['bookLocation'],
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
            ),
          ],
        ),
      ),
      //drawer
      drawer: Drawer(
        child: Material(
          color: accentColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: secLightColor),
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Row(
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Colors.transparent,
                        child: Image.asset(
                          'assets/image/profil.png',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Admin',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'admin@gmail.com',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: secdarkColor,
                              padding: const EdgeInsets.all(7)),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.logout_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                          label: Text(
                            'Log Out',
                            style: Theme.of(context).textTheme.button?.copyWith(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 16),
                    ListTile(
                      leading: const Icon(
                        Icons.menu_book_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Daftar Buku',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, MainPageAdmin.routeName);
                      },
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      leading: const Icon(
                        Icons.group,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Daftar Peminjaman',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
  //   if (documentSnapshot != null) {
  //     // // final TextEditingController _bookAuthorController = TextEditingController();
  //     // // final TextEditingController _bookLocationController = TextEditingController();
  //     // final TextEditingController _bookTitleController = TextEditingController();
  //     // final TextEditingController _bookUrlController = TextEditingController();
  //     // // final TextEditingController _idController = TextEditingController();
  //     // // // bool or false
  //     // // // final TextEditingController _isAvailableController = TextEditingController();
  //     // bool _isAvaiable;
  //     // //
  //     // // final TextEditingController _publisherController = TextEditingController();
  //     // // final TextEditingController _ratingController = TextEditingController();
  //     // // final TextEditingController _releaseDateController = TextEditingController();
  //     // // final TextEditingController _synopsisController = TextEditingController();
  //
  //
  //     _bookTitleController.text = documentSnapshot['bookTitle'];
  //     _bookUrlController.text = documentSnapshot['bookUrl'];
  //     _isAvaiable = documentSnapshot['isAvailable'];
  //
  //
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
  //                 controller: _bookTitleController,
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

  Future<void> _delete(String productId) async {
    await _books.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Menghapus buku telah berhasil.')));
  }

  @override
  void dispose() {
    _searchControl.dispose();
    super.dispose();
  }
}
