import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';
import 'package:gobooks/pages/user/detail_book_page.dart';
import 'package:gobooks/widgets/booklist.dart';

class BookByYearPage extends StatelessWidget {
  static const ROUTE_NAME = '/bookByYearPage';
  final CollectionReference _books =
      FirebaseFirestore.instance.collection('Book');
  // final int minYear;
  // final int maxYear;

  BookByYearPage({
    Key? key,
    // required this.minYear,
    // required this.maxYear
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
          final List<int> yearNumber = <int>[];
          if (streamSnapshot.hasData) {
            streamSnapshot.data!.docs.asMap().forEach((index, value) {
              if (value['yearPublished'] >= 2010 &&
                  value['yearPublished'] <= 2022) {
                yearNumber.add(index);
              }
              yearNumber.sort();
            });
            //ascending order
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: yearNumber.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[yearNumber[index]];
                return BookList(
                  documentSnapshot: documentSnapshot,
                );
              },
              //decending order
              /* return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: yearNumber.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[yearNumber.reversed[index]];
                return BookList(
                  documentSnapshot: documentSnapshot,
                );
              },
            */
            );
            // return ListView.builder(
            //   scrollDirection: Axis.vertical,
            //   itemCount: streamSnapshot.data!.docs.length,
            //   itemBuilder: (context, index) {
            //     final DocumentSnapshot documentSnapshot = streamSnapshot
            //         .data!.docs[index];
            //     return BookList(
            //       documentSnapshot: documentSnapshot,
            //     );
            //   },
            // );
          }
          return const Center(
            child: CircularProgressIndicator(color: Colors.red),
          );
        },
      ),
    );
  }
}
