import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';
import 'package:gobooks/widgets/booklist.dart';

class PopularPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular_page';
  const PopularPage({Key? key}) : super(key: key);

  @override
  State<PopularPage> createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  final CollectionReference _books =
      FirebaseFirestore.instance.collection('Book');
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
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Popular',
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
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];

                    return BookList(
                      key: Key('bookmark_list'),
                      documentSnapshot: documentSnapshot,
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            }));
  }
}
