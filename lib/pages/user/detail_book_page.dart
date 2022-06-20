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
          title: Text(
              'Detail Buku',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
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
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
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
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  documentSnapshot['bookUrl'],
                                  fit: BoxFit.cover,
                                  width: size.height * 0.15,
                                ),
                              ),
                              const SizedBox(height: 5),
                              // Text(
                              //     documentSnapshot['id'],
                              //     style: const TextStyle(fontWeight: FontWeight.bold)
                              // ),
                              // const SizedBox(height: 5),
                              Text('${documentSnapshot['numberOfPages']} Halaman'),
                              Text('Tahun Terbit : ${documentSnapshot['yearPublished']}'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Status : ',
                                      style: TextStyle(color: accentColor)),
                                  Text(status(documentSnapshot['isAvailable']))
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
                                      color: Colors.lightGreen,
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
                                    child: const Text(
                                      'Pinjam',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.black87,
                        thickness: 2,
                      ),
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
                                    ?.copyWith(
                                    color: Colors.black, fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                              Text('Author',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(color: accentColor),
                                textAlign: TextAlign.center,
                              ),
                              Text(documentSnapshot['bookAuthor']),
                              Text('Penerbit',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(color: accentColor)
                              ),
                              Text(documentSnapshot['publisher']),
                              Text('Letak Buku',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(color: accentColor)
                              ),
                              Text(documentSnapshot['bookLocation']),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  width: size.width,
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
                        Text(documentSnapshot['synopsis']),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }

  String status(bool value) {
    return value == true ? 'Tersedia' : 'Tidak tersedia';
  }
}
