import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';
import 'package:gobooks/pages/admin/booking_list_page.dart';

class MainPageAdmin extends StatefulWidget {
  const MainPageAdmin({Key? key}) : super(key: key);
  static const routeName = '/main_page_admin';
  @override
  State<MainPageAdmin> createState() => _MainPageAdminState();
}

class _MainPageAdminState extends State<MainPageAdmin> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  final TextEditingController _bookAuthorController = TextEditingController();
  final TextEditingController _bookLocationController = TextEditingController();
  final TextEditingController _bookTitleController = TextEditingController();
  final TextEditingController _bookUrlController = TextEditingController();
  final TextEditingController _publisherController = TextEditingController();
  final TextEditingController _numberOfPagesController =
      TextEditingController();
  final TextEditingController _synopsisController = TextEditingController();
  final TextEditingController _yearPublishedController =
      TextEditingController();
  late bool _isAvailable = true;

  final CollectionReference _books =
      FirebaseFirestore.instance.collection('Book');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Fungsi untuk menambahkan buku
    Future<void> _create() async {
      await showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext ctx) {
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
                        _bookTitleController.text = "";
                        _bookUrlController.text = "";
                        _bookAuthorController.text = "";
                        _publisherController.text = "";
                        _bookLocationController.text = "";
                        _synopsisController.text = "";
                        _yearPublishedController.text = "";
                        _numberOfPagesController.text = "";
                        _isAvailable = true;
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
                          color: accentColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
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
                                  controller: _bookTitleController,
                                  decoration: InputDecoration(
                                    labelText: "Judul Buku",
                                    icon: const Icon(Icons.book),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: _numberOfPagesController,
                                  decoration: InputDecoration(
                                    labelText: "Jumlah Halaman",
                                    icon: const Icon(Icons.people),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: _yearPublishedController,
                                  decoration: InputDecoration(
                                    labelText: "Tahun Terbit",
                                    icon: const Icon(Icons.people),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: _publisherController,
                                  decoration: InputDecoration(
                                    labelText: "Penerbit Buku",
                                    icon: const Icon(
                                        Icons.published_with_changes),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                              ),
                              SwitchListTile(
                                title:
                                    Text('Status : ${_status(_isAvailable)}'),
                                value: _isAvailable,
                                onChanged: (value) {
                                  setState(() {
                                    _isAvailable = value;
                                  });
                                },
                                activeTrackColor: secdarkColor,
                                activeColor: accentColor,
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  primary: secdarkColor,
                                  padding: const EdgeInsets.all(7),
                                ),
                                onPressed: () {
                                  final String bookTitle =
                                      _bookTitleController.text;
                                  final String bookUrl =
                                      _bookUrlController.text;
                                  final String author =
                                      _bookAuthorController.text;
                                  final int? numberOfPages = int.tryParse(
                                      _numberOfPagesController.text);
                                  final String publisher =
                                      _publisherController.text;
                                  final int? yearPublished = int.tryParse(
                                      _yearPublishedController.text);
                                  final String bookLocation =
                                      _bookLocationController.text;
                                  final String synopsis =
                                      _synopsisController.text;
                                  final bool isAvailable = _isAvailable;

                                  _books.add({
                                    "bookTitle": bookTitle, //
                                    "bookUrl": bookUrl, //
                                    "bookAuthor": author, //
                                    "numberOfPages": numberOfPages, //
                                    "publisher": publisher, //
                                    "yearPublished": yearPublished, //
                                    "bookLocation": bookLocation, //
                                    "synopsis": synopsis, //
                                    "isAvailable": isAvailable, //
                                    "dateBorrowed": "",
                                    "dateReturned": "",
                                    "history": false,
                                    "isBookmarked": false,
                                  });

                                  _bookTitleController.text = "";
                                  _bookUrlController.text = "";
                                  _bookAuthorController.text = "";
                                  _numberOfPagesController.text = "";
                                  _publisherController.text = "";
                                  _yearPublishedController.text = "";
                                  _bookLocationController.text = "";
                                  _synopsisController.text = "";
                                  _isAvailable = true;

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Anda telah berhasil menambahkan buku.')));
                                },
                                icon: const Icon(
                                  Icons.save_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                label: Text(
                                  'Simpan',
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            );
          });
    }

    //Update Informasi Buku
    Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
      if (documentSnapshot != null) {
        _bookTitleController.text = documentSnapshot['bookTitle'];
        _bookUrlController.text = documentSnapshot['bookUrl'];
        _bookAuthorController.text = documentSnapshot['bookAuthor'];
        _numberOfPagesController.text =
            documentSnapshot['numberOfPages'].toString();
        _publisherController.text = documentSnapshot['publisher'];
        _yearPublishedController.text =
            documentSnapshot['yearPublished'].toString();
        _bookLocationController.text = documentSnapshot['bookLocation'];
        _synopsisController.text = documentSnapshot['synopsis'];
        _isAvailable = documentSnapshot['isAvailable'];
      }

      await showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext ctx) {
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
                        _bookTitleController.text = "";
                        _bookUrlController.text = "";
                        _bookAuthorController.text = "";
                        _publisherController.text = "";
                        _bookLocationController.text = "";
                        _synopsisController.text = "";
                        _numberOfPagesController.text = "";
                        _yearPublishedController.text = "";
                        _isAvailable = true;
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
                      'Perbaharui Buku',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: accentColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
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
                                  controller: _bookTitleController,
                                  decoration: InputDecoration(
                                    labelText: "Judul Buku",
                                    icon: const Icon(Icons.book),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: _numberOfPagesController,
                                  decoration: InputDecoration(
                                    labelText: "Jumlah Halaman",
                                    icon: const Icon(Icons.people),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: _publisherController,
                                  decoration: InputDecoration(
                                    labelText: "Penerbit Buku",
                                    icon: const Icon(
                                        Icons.published_with_changes),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: _yearPublishedController,
                                  decoration: InputDecoration(
                                    labelText: "Tahun Terbit",
                                    icon: const Icon(Icons.people),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                              ),
                              SwitchListTile(
                                title:
                                    Text('Status : ${_status(_isAvailable)}'),
                                value: _isAvailable,
                                onChanged: (value) {
                                  setState(() {
                                    _isAvailable = value;
                                  });
                                },
                                activeTrackColor: secdarkColor,
                                activeColor: accentColor,
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  primary: secdarkColor,
                                  padding: const EdgeInsets.all(7),
                                ),
                                onPressed: () {
                                  final String bookTitle =
                                      _bookTitleController.text;
                                  final String bookUrl =
                                      _bookUrlController.text;
                                  final String author =
                                      _bookAuthorController.text;
                                  final int? numberOfPages = int.tryParse(
                                      _numberOfPagesController.text);
                                  final String publisher =
                                      _publisherController.text;
                                  final int? yearPublished = int.tryParse(
                                      _yearPublishedController.text);
                                  final String bookLocation =
                                      _bookLocationController.text;
                                  final String synopsis =
                                      _synopsisController.text;
                                  final bool isAvailable = _isAvailable;

                                  _books.doc(documentSnapshot!.id).update({
                                    "bookTitle": bookTitle,
                                    "bookUrl": bookUrl,
                                    "bookAuthor": author,
                                    "numberOfPages": numberOfPages,
                                    "publisher": publisher,
                                    "yearPublished": yearPublished,
                                    "bookLocation": bookLocation,
                                    "synopsis": synopsis,
                                    "isAvailable": isAvailable
                                  });

                                  _bookTitleController.text = "";
                                  _bookUrlController.text = "";
                                  _bookAuthorController.text = "";
                                  _numberOfPagesController.text = "";
                                  _publisherController.text = "";
                                  _yearPublishedController.text = "";
                                  _bookLocationController.text = "";
                                  _synopsisController.text = "";
                                  _isAvailable = true;
                                  Navigator.of(context).pop();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Anda telah berhasil memperbaharui buku.')));
                                },
                                icon: const Icon(
                                  Icons.update,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                label: Text(
                                  'Update',
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            );
          });
    }

    //Menghapus Buku
    Future<void> _delete(String bookId) async {
      await _books.doc(bookId).delete();

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Anda telah berhasil menghapus buku.')));
    }

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
        actions: [
          IconButton(
              onPressed: () {},
              icon: Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: const Icon(
                  Icons.bookmark_outline_rounded,
                  color: Colors.black,
                  size: 25,
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _create(),
        child: const Icon(Icons.add),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        offset:
                            const Offset(2, 3), // changes position of shadow
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
                      hintText: "Cari Buku",
                      border: InputBorder.none,
                    ),
                    onChanged: (String value) {},
                  ),
                ),
              ),
              const SizedBox(height: 5),
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
                          return Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              title: Text(documentSnapshot['bookTitle']),
                              subtitle: Text(
                                  documentSnapshot['yearPublished'].toString()),
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () =>
                                            _update(documentSnapshot)),
                                    IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () =>
                                            _delete(documentSnapshot.id)),
                                  ],
                                ),
                              ),
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
                        Navigator.pop(context);
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
                        Navigator.pushNamed(context, BookingPage.routeName);
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

  String _status(bool value) {
    return value == true ? 'Tersedia' : 'Tidak tersedia';
  }
}
