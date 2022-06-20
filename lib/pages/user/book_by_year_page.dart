import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';
import 'package:gobooks/pages/user/detail_book_page.dart';
import 'package:gobooks/widgets/booklist.dart';

class BookByYearPage extends StatelessWidget {
  static const ROUTE_NAME = '/bookByYearPage';
  final CollectionReference _books = FirebaseFirestore.instance.collection('Book');
  final int minYear;
  final int maxYear;

  BookByYearPage({
    Key? key,
    required this.minYear,
    required this.maxYear
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Buku berdasarkan Tahun',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: accentColor, fontSize: 25),
        ),
      ),
      body: StreamBuilder(
        stream: _books.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[index];
                final year = documentSnapshot['yearPublished'];
                if(year > 2010 && year <= 2022){
                  return BookList(
                    documentSnapshot: documentSnapshot,
                  );
                } else {
                  return const Center();
                }
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: Colors.red),
          );
        },
      ),
    );
  }
}

