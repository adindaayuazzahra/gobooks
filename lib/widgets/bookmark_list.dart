import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';
import 'package:gobooks/pages/user/detail_book_page.dart';

class BookmarkList extends StatelessWidget {
  final CollectionReference _books =
      FirebaseFirestore.instance.collection('Book');
  final DocumentSnapshot documentSnapshot;

  BookmarkList({
    Key? key,
    required this.documentSnapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isBookmarked = documentSnapshot['isBookmarked'];
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
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
                          SizedBox(
                            width: 130,
                            child: Text(
                              documentSnapshot['bookAuthor'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder(
                      stream: _books.snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return IconButton(
                              onPressed: () {
                                isBookmarked == true
                                    ? isBookmarked = false
                                    : isBookmarked = true;
                                _books
                                    .doc(documentSnapshot.id)
                                    .update({"isBookmarked": isBookmarked});
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Menghapus buku dari bookmark.'),
                                        duration: Duration(milliseconds: 500)));
                              },
                              icon: isBookmarked == true
                                  ? Container(
                                      margin: const EdgeInsets.only(right: 8.0),
                                      child: const Icon(
                                        Icons.bookmark,
                                        color: Colors.black,
                                        size: 25,
                                      ),
                                    )
                                  : Container(
                                      margin: const EdgeInsets.only(right: 8.0),
                                      child: const Icon(
                                        Icons.bookmark_outline_rounded,
                                        color: Colors.black,
                                        size: 25,
                                      ),
                                    ));
                        }
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.red),
                        );
                      },
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
