import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

class DetailBookPage extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  const DetailBookPage({Key? key, required this.documentSnapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                                documentSnapshot['bookUrl'],
                                fit: BoxFit.cover,
                                width: size.width * 0.5,
                                height: size.height * 0.24,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Text(
                          //     documentSnapshot['id'],
                          //     style: const TextStyle(fontWeight: FontWeight.bold)
                          // ),
                          // const SizedBox(height: 5),
                          Text(
                            '${documentSnapshot['numberOfPages']} Halaman',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            'Tahun Terbit : ${documentSnapshot['yearPublished']}',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(fontSize: 13),
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // const Text('Status : ',
                              //     style: TextStyle(color: accentColor)),
                              Text(
                                status(documentSnapshot['isAvailable']),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                        color: Colors.green, fontSize: 16),
                              )
                              // Text('Tersedia',
                              //     style: TextStyle(color: Colors.green)),
                              // Text(
                              //     'Tidak tersedia',
                              //     style: TextStyle(color: Colors.red)
                              // )
                            ],
                          ),
                          InkWell(
                            onTap: () {},
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
                              child: Text(
                                'PINJAM',
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const VerticalDivider(
                  //   color: Colors.black,
                  //   thickness: 3,
                  // ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            documentSnapshot['bookTitle'],
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
                            documentSnapshot['bookAuthor'],
                            textAlign: TextAlign.center,
                          ),
                          Text('Penerbit',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: accentColor, fontSize: 16)),
                          Text(
                            documentSnapshot['publisher'],
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
                            documentSnapshot['bookLocation'],
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
                      documentSnapshot['synopsis'],
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

  String status(bool value) {
    return value == true ? 'Tersedia' : 'Tidak tersedia';
  }
}
