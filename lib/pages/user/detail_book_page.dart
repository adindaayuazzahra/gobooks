import 'package:gobooks/main.dart';

class DetailBookPage extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;

  const DetailBookPage({Key? key, required this.documentSnapshot})
      : super(key: key);

  @override
  State<DetailBookPage> createState() => _DetailBookPageState();
}

class _DetailBookPageState extends State<DetailBookPage> {
  @override
  Widget build(BuildContext context) {
    final CollectionReference _books =
        FirebaseFirestore.instance.collection('Book');
    var dt = DateTime.now();
    var date =
        '${dt.day} '
        '${(dt.month == 1)? 'Jan':(dt.month == 2) ? 'Feb': (dt.month == 3) ? 'Mar'
          : (dt.month == 4)? 'Apr':(dt.month == 5) ? 'Mei': (dt.month == 6) ? 'Jun'
          : (dt.month == 7) ? 'Jul':(dt.month == 8) ? 'Agt': (dt.month == 9) ? 'Sep'
          : (dt.month == 10)? 'Okt':(dt.month == 11) ? 'Nov': 'Des'} '
        '${dt.year} • ${dt.hour} : ${dt.minute}';


    bool isAvailable = widget.documentSnapshot['isAvailable'];
    bool isBookmarked = widget.documentSnapshot['isBookmarked'];
    bool history = widget.documentSnapshot['history'];

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail Buku',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: accentColor, fontWeight: FontWeight.bold, fontSize: 25)),
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
        actions: [
          StreamBuilder(
            stream: _books.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return IconButton(
                    onPressed: () {
                      if (isBookmarked == false) {
                        isBookmarked = true;
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Menambahkan buku ke bookmark.'),
                                duration: Duration(milliseconds: 600))
                        );
                      } else {
                        isBookmarked = false;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Menghapus buku dari bookmark.'),
                              duration: Duration(milliseconds: 600)),
                        );
                      }
                      _books
                          .doc(widget.documentSnapshot.id)
                          .update({"isBookmarked": isBookmarked});
                    },
                    icon: isBookmarked == true
                        ? Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            child: const Icon(
                              Icons.bookmark,
                              color: Colors.black,
                              size: 25,
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            child: const Icon(
                              Icons.bookmark_outline_rounded,
                              color: Colors.black,
                              size: 25,
                            ),
                          )
                );
              }
              return const Center(
                child: CircularProgressIndicator(color: accentColor),
              );
            },
          ),
        ],
        backgroundColor: Colors.blue.withOpacity(0),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 16),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                widget.documentSnapshot['bookUrl'],
                                fit: BoxFit.cover,
                                width: size.width * 0.5,
                                height: size.height * 0.24,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${widget.documentSnapshot['numberOfPages']} Halaman',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            'Tahun Terbit : ${widget.documentSnapshot['yearPublished']}',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(fontSize: 13),
                            textAlign: TextAlign.center,
                          ),
                          StreamBuilder(
                            stream: _books.snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                              if (streamSnapshot.hasData) {
                                return SizedBox(
                                  child: isAvailable == true
                                      ? Text(
                                          'Tersedia',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              ?.copyWith(
                                                  color: Colors.green,
                                                  fontSize: 16),
                                        )
                                      : Text('Sedang dipinjam',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              ?.copyWith(
                                                  color: Colors.red,
                                                  fontSize: 16)
                                  ),
                                );
                              }
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.red),
                              );
                            },
                          ),
                          Container(
                            width: size.width * 0.35,
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: secdarkColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(2, 3),
                                ),
                              ],
                            ),
                            child: StreamBuilder(
                              stream: _books.snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                                if (streamSnapshot.hasData) {
                                  return InkWell(
                                    onTap: () {
                                      if (isAvailable == true) {
                                        history = true;
                                        isAvailable = false;
                                        _books
                                            .doc(widget.documentSnapshot.id)
                                            .update({"dateBorrowed": date});
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Buku Telah Berhasil Dipinjam.'),
                                            duration:
                                                Duration(milliseconds: 600),
                                          ),
                                        );
                                      } else {
                                        isAvailable = true;
                                        _books
                                            .doc(widget.documentSnapshot.id)
                                            .update({"history": history});
                                        _books
                                            .doc(widget.documentSnapshot.id)
                                            .update({"dateReturned": date});
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Buku telah dikembalikan.'),
                                            duration:
                                                Duration(milliseconds: 600),
                                          ),
                                        );
                                      }
                                      _books
                                          .doc(widget.documentSnapshot.id)
                                          .update({"history": history});
                                      _books
                                          .doc(widget.documentSnapshot.id)
                                          .update({"isAvailable": isAvailable});
                                    },
                                    child: isAvailable == true
                                        ? Text('PINJAM',
                                            style: Theme.of(context)
                                                .textTheme
                                                .button
                                                ?.copyWith(color: Colors.white))
                                        : Text(
                                            'KEMBALIKAN',
                                            style: Theme.of(context)
                                                .textTheme
                                                .button
                                                ?.copyWith(
                                                    color: Colors.white,
                                                    fontSize: 13),
                                          ),
                                  );
                                }
                                return const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.red),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.documentSnapshot['bookTitle'],
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(color: Colors.black, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Author',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(color: accentColor, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            widget.documentSnapshot['bookAuthor'],
                            textAlign: TextAlign.center,
                          ),
                          Text('Penerbit',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: accentColor, fontSize: 16)
                          ),
                          Text(
                            widget.documentSnapshot['publisher'],
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Letak Buku',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(color: accentColor, fontSize: 16),
                          ),
                          Text(
                            widget.documentSnapshot['bookLocation'],
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 9),
              padding: const EdgeInsets.all(8.0),
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Sinopsis',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: accentColor),
                    ),
                    Text(
                      widget.documentSnapshot['synopsis'],
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}