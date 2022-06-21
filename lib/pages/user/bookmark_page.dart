import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gobooks/widgets/bookmark_list.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

import '../../widgets/booklist.dart';

class BookmarkPage extends StatelessWidget {
  static const ROUTE_NAME = '/bookmark';
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionReference _books = FirebaseFirestore.instance.collection('Book');
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
            color: accentColor,
            size: 25,
          ),
        ),
        title: Text(
          'Bookmark',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: accentColor, fontSize: 25),
        ),
      ),

      body: StreamBuilder(
        stream: _books.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          final List<int> listOfBooked = <int>[];
          if (streamSnapshot.hasData) {
            streamSnapshot.data!.docs.asMap().forEach((index, value) {
              if(value['isAvailable'] == false){
                listOfBooked.add(index);
              }
            });
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listOfBooked.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot = streamSnapshot
                    .data!.docs[listOfBooked[index]];
                return BookList(
                  documentSnapshot: documentSnapshot,
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: accentColor),
          );
        },
      ),
    );
  }
}
