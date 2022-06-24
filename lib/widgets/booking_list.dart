import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

import '../pages/user/detail_book_page.dart';

class AdminBookList extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  const AdminBookList({
    Key? key,
    required this.documentSnapshot
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,
          MaterialPageRoute(builder: (context) =>
              DetailBookPage(documentSnapshot: documentSnapshot)
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(

                child: Text(
                  documentSnapshot['bookTitle'],
                  // overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Author : ${documentSnapshot['bookAuthor']}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontSize: 12),
              ),
            ],
          ),
        )
      ),
    );
  }
}