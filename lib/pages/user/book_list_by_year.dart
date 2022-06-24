import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';
import 'package:gobooks/pages/user/detail_book_page.dart';

class BookListByYear extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  const BookListByYear({
    Key? key,
    required this.documentSnapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => DetailBookPage(documentSnapshot: documentSnapshot)
          ));
        },
        child: Card(
          elevation: 7,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    documentSnapshot['bookUrl'],
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 130,
                              child: Text(
                                documentSnapshot['bookTitle'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
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
                            Text("Tahun terbit : ${documentSnapshot['yearPublished'].toString()}",
                                style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      ),
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