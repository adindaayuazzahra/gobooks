import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

import 'bookmark_page.dart';

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
    var isBookmarked = widget.documentSnapshot['isBookmarked'];

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
          IconButton(
              onPressed: () {
                isBookmarked == true ? isBookmarked = false : isBookmarked = true;
                _books.doc(widget.documentSnapshot.id).update({"isBookmarked": isBookmarked});
              },
              icon: isBookmarked == true ? Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: const Icon(
                  Icons.bookmark,
                  color: Colors.black,
                  size: 25,
                ),
              ) : Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: const Icon(
                  Icons.bookmark_outline_rounded,
                  color: Colors.black,
                  size: 25,
                ),
              )
          )
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              widget.documentSnapshot['isAvailable'] == true
                                  ? Text('Tersedia',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                              color: Colors.green,
                                              fontSize: 16))
                                  : Text('Tidak Tersedia',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                              color: Colors.red, fontSize: 16))
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              bool history = widget.documentSnapshot['history'];
                              // history == true ? history = false : history = true;
                              history = true;

                              _books.doc(widget.documentSnapshot.id)
                                  .update({"history": history});

                              String dateReturned = widget.documentSnapshot['dateReturned'];
                              var dt = DateTime.now();
                              var date = '${dt.day} - ${dt.month} - ${dt.year} • ${dt.hour} : ${dt.minute}';

                              // ● ◦
                              _books.doc(widget.documentSnapshot.id).update({"dateBorrowed": date});
                              // _books.doc(documentSnapshot.id).update({"dateReturned": ""});

                              final bool isAvailable = widget.documentSnapshot['isAvailable'];
                              // isAvailable == true
                              //     ? _books.doc(documentSnapshot.id).update({"isAvailable": false})
                              //
                              //     : dateReturned != "" ? _books.doc(documentSnapshot.id).update({"isAvailable": true, "dateReturned": date})
                              //
                              //     : dateReturned == "" ;
                              isAvailable == true
                                  ? _books.doc(widget.documentSnapshot.id).update({"isAvailable": false})

                                  : _books.doc(widget.documentSnapshot.id).update({"isAvailable": true, "dateReturned": date});
                            },
                            child: Container(
                              width: size.height * 0.15,
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
                              child: widget.documentSnapshot['isAvailable'] == true
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
                                          ?.copyWith(color: Colors.white),
                                    ),
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
                                  ?.copyWith(color: accentColor, fontSize: 16)),
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
