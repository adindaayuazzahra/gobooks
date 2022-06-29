import 'package:gobooks/main.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);
  static const routeName = '/main_page_admin';
  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
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

  final TextEditingController _searchControl = TextEditingController();
  String queries = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future<void> _create() async {
      await showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext ctx) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
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
                                    icon: const Icon(
                                        Icons.insert_page_break_outlined),
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
                                    icon: const Icon(Icons.date_range),
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
                                    icon: const Icon(Icons.newspaper),
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
                                    "bookTitle": bookTitle,
                                    "bookUrl": bookUrl,
                                    "bookAuthor": author,
                                    "numberOfPages": numberOfPages,
                                    "publisher": publisher,
                                    "yearPublished": yearPublished,
                                    "bookLocation": bookLocation,
                                    "synopsis": synopsis,
                                    "isAvailable": isAvailable,
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
                                              'Anda telah berhasil menambahkan buku.'),
                                          duration:
                                              Duration(milliseconds: 500)));
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
              debugShowCheckedModeBanner: false,
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
                                    icon: const Icon(
                                        Icons.insert_page_break_outlined),
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
                                    icon: const Icon(Icons.newspaper),
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
                                      _yearPublishedController.text) ?? 0;
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
                                              'Anda telah berhasil memperbaharui buku.'),
                                          duration:
                                              Duration(milliseconds: 500)));
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

    Future<void> _delete(String bookId) async {
      await _books.doc(bookId).delete();

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Anda telah berhasil menghapus buku.'),
          duration: Duration(milliseconds: 500)));
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Dashboard',
          style: Theme.of(context).textTheme.headline6?.copyWith(
              color: accentColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
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
                  margin: const EdgeInsets.only(top: 10),
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
                        offset: const Offset(2, 3),
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
                      hintText: "Cari Judul atau Penulis",
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        queries = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                  height: size.height * 0.9,
                  child: queries == ""
                      ? StreamBuilder(
                          stream: _books.snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                            if (streamSnapshot.hasData) {
                              return Column(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        width: size.width * 0.90,
                                        child: Text(
                                          'Jumlah buku : ${streamSnapshot.data!.docs.length}',
                                          style: const TextStyle(
                                              color: accentColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                  Expanded(
                                    flex: 30,
                                    child: ListView.builder(
                                      itemCount:
                                          streamSnapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        final DocumentSnapshot
                                            documentSnapshot =
                                            streamSnapshot.data!.docs[index];
                                        return Card(
                                          margin: const EdgeInsets.all(10),
                                          child: ListTile(
                                            title: Text(
                                                documentSnapshot['bookTitle']),
                                            trailing: SizedBox(
                                              width: 100,
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                      icon: const Icon(
                                                          Icons.edit),
                                                      onPressed: () => _update(
                                                          documentSnapshot)),
                                                  IconButton(
                                                      icon: const Icon(
                                                          Icons.delete),
                                                      onPressed: () => _delete(
                                                          documentSnapshot.id)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        )
                      : StreamBuilder(
                          stream: _books.snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                            if (streamSnapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: streamSnapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  final DocumentSnapshot documentSnapshot =
                                      streamSnapshot.data!.docs[index];
                                  if (documentSnapshot['bookTitle']
                                          .toString()
                                          .toLowerCase()
                                          .contains(queries.toLowerCase()) ||
                                      documentSnapshot['bookTitle']
                                          .toString()
                                          .toLowerCase()
                                          .startsWith(queries.toLowerCase())) {
                                    return Card(
                                      margin: const EdgeInsets.all(10),
                                      child: ListTile(
                                        title:
                                            Text(documentSnapshot['bookTitle']),
                                        trailing: SizedBox(
                                          width: 100,
                                          child: Row(
                                            children: [
                                              IconButton(
                                                  icon: const Icon(Icons.edit),
                                                  onPressed: () => _update(
                                                      documentSnapshot)),
                                              IconButton(
                                                  icon:
                                                      const Icon(Icons.delete),
                                                  onPressed: () => _delete(
                                                      documentSnapshot.id)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (documentSnapshot['bookAuthor']
                                          .toString()
                                          .toLowerCase()
                                          .contains(queries.toLowerCase()) ||
                                      documentSnapshot['bookTitle']
                                          .toString()
                                          .toLowerCase()
                                          .startsWith(queries.toLowerCase())) {
                                    return Card(
                                      margin: const EdgeInsets.all(10),
                                      child: ListTile(
                                        title:
                                            Text(documentSnapshot['bookTitle']),
                                        trailing: SizedBox(
                                          width: 100,
                                          child: Row(
                                            children: [
                                              IconButton(
                                                  icon: const Icon(Icons.edit),
                                                  onPressed: () => _update(
                                                      documentSnapshot)),
                                              IconButton(
                                                  icon:
                                                      const Icon(Icons.delete),
                                                  onPressed: () => _delete(
                                                      documentSnapshot.id)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const Center();
                                  }
                                },
                              );
                            }
                            return const Center(
                              child:
                                  CircularProgressIndicator(color: accentColor),
                            );
                          },
                        )),
            ],
          ),
        ),
      ),
    );
  }

  String _status(bool value) {
    return value == true ? 'Tersedia' : 'Tidak tersedia';
  }

  @override
  void dispose() {
    _searchControl.dispose();
    super.dispose();
  }
}
