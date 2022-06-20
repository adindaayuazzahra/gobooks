import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

import '../pages/user/detail_book_page.dart';

class RecommendationList extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  const RecommendationList({
    Key? key,
    required this.documentSnapshot
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => DetailBookPage(documentSnapshot: documentSnapshot)
            ),
          );
        },
        child: Card(
          //color: secLightColor,
          elevation: 7,
          margin: const EdgeInsets.fromLTRB(6, 13, 10, 13),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    documentSnapshot['bookUrl'],
                    fit: BoxFit.cover,
                      width: 90,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Text(
                          documentSnapshot['bookTitle'],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme.bodyText1
                              ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: accentColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(documentSnapshot['bookAuthor'],
                          style: Theme.of(context)
                              .textTheme.bodyText2
                              ?.copyWith(
                              fontWeight: FontWeight.bold)
                      ),
                      // Row(
                      //   children: [
                      //     const Icon(
                      //       Icons.star,
                      //       color: Colors.amber,
                      //     ),
                      //     Text(
                      //       documentSnapshot['rating'].toString(),
                      //       style: Theme.of(context).textTheme.bodyText2,
                      //     ),
                      //   ],
                      // ),
                      Text('${documentSnapshot['numberOfPages']} Halaman')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}