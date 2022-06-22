import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';
import 'package:gobooks/pages/user/detail_book_page.dart';

class HistoryList extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  const HistoryList({
    Key? key,
    required this.documentSnapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailBookPage(documentSnapshot: documentSnapshot)));
      },
      child: Card(
        elevation: 7,
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    documentSnapshot['bookUrl'],
                    fit: BoxFit.cover,
                    //width: size.width * 0.25,
                    width: 80,
                    height: 80,
                  ),
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
                          const SizedBox(height: 4),
                          Text(
                            'Tanggal dikembalikan :',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(fontSize: 12),
                          ),
                          Text(
                            '${documentSnapshot["date"]}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Dipinjam',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
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
