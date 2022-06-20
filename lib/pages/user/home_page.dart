import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/pages/user/bookmark_page.dart';
import 'package:gobooks/common/styles.dart';
import 'package:gobooks/pages/user/detail_book_page.dart';
import 'package:gobooks/pages/user/Latest_Book_Page.dart';
import 'package:gobooks/pages/user/Library_Book_Page.dart';
import 'package:gobooks/widgets/category_list.dart';
import 'package:gobooks/widgets/popular_list.dart';
import 'package:gobooks/widgets/recommendation_list.dart';
import 'package:gobooks/widgets/writer_list.dart';
import 'dart:math';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final CollectionReference _books = FirebaseFirestore.instance.collection('Book');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          'goBooks',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(
              color: accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 25
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, BookmarkPage.ROUTE_NAME);
            },
            icon: const Icon(
              Icons.bookmark_outline_rounded,
              color: Colors.black,
              size: 25,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 30),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 17),
                padding: const EdgeInsets.symmetric(horizontal: 17),
                height: size.height * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: secLightColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 160,
                          child: Text(
                            'Lorem ipsum dolor sit amet',
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style:
                            Theme.of(context).textTheme.subtitle2?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        SizedBox(
                          width: 160,
                          child: Text(
                            'Etiam tempor blandit ligula a iaculis. Donec ',
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style:
                            Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/image/banner.png',
                      fit: BoxFit.fitWidth,
                      width: 125,
                    ),
                  ],
                ),
                // child: StreamBuilder(
                //   stream: _books.snapshots(),
                //   builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                //     if (streamSnapshot.hasData) {
                //       int randomNumber = Random().nextInt(4);
                //       final DocumentSnapshot documentSnapshot =
                //             streamSnapshot.data!.docs[randomNumber];
                //       return Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               SizedBox(
                //                 width: 160,
                //                 child: Text(
                //                   documentSnapshot['bookTitle'],
                //                   textAlign: TextAlign.start,
                //                   maxLines: 3,
                //                   overflow: TextOverflow.ellipsis,
                //                   style:
                //                   Theme.of(context).textTheme.subtitle2?.copyWith(
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 15,
                //                   ),
                //                 ),
                //               ),
                //               const SizedBox(height: 3),
                //               SizedBox(
                //                 width: 160,
                //                 child: Text(
                //                   documentSnapshot['bookAuthor'],
                //                   textAlign: TextAlign.start,
                //                   maxLines: 3,
                //                   overflow: TextOverflow.ellipsis,
                //                   style:
                //                   Theme.of(context).textTheme.bodyText1?.copyWith(
                //                     fontSize: 12,
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //           ClipRRect(
                //             borderRadius: BorderRadius.circular(10.0),
                //             child: Image.network(
                //               documentSnapshot['bookUrl'],
                //               fit: BoxFit.cover,
                //               width: 70,
                //             ),
                //           ),
                //         ],
                //
                //       );
                //     }
                //     return const Center(
                //       child: CircularProgressIndicator(color: Colors.red),
                //     );
                //   },
                // ),
              ),
              _buildSubHeading(
                title: 'Tahun dipublikasi',
                onTap: () {},
                key: const Key('kategori_lainnya'),
              ),
              SizedBox(
                height: size.height * 0.075,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryList(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const LibraryBookPage()
                        ));
                      },
                      numberOfPages: '2010 - Sekarang',
                    ),
                    CategoryList(
                      onTap: (){},
                      numberOfPages: '2000 - 1975',
                    ),
                    CategoryList(
                      onTap: (){},
                      numberOfPages: '1974 - 1950',
                    ),
                    CategoryList(
                      onTap: (){},
                      numberOfPages: '1949 - 1900',
                    ),
                    CategoryList(
                      onTap: (){},
                      numberOfPages: '> 1899',
                    ),
                  ],
                )
              ),
              const SizedBox(height: 5),
              _buildSubHeading(
                title: 'List Buku Perpustakaan',
                onTap: () {
                  Navigator.pushNamed(context, LibraryBookPage.ROUTE_NAME);
                },
                key: const Key('rekomendasi_lainnya'),
              ),
              SizedBox(
                height: 180,
                child: StreamBuilder(
                  stream: _books.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                          return RecommendationList(
                              documentSnapshot: documentSnapshot
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    );
                  },
                ),
              ),
              _buildSubHeading(
                title: 'List Buku Terbaru',
                onTap: () {
                  Navigator.pushNamed(context, LatestBookPage.ROUTE_NAME);
                },
                key: const Key('popular_lainnya'),
              ),
              SizedBox(
                height: 277,
                child: StreamBuilder(
                  stream: _books.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                          return PopularList(
                            key: const Key('popular_list_1'),
                            documentSnapshot: documentSnapshot,
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    );
                  },
                ),
              ),
              // const SizedBox(height: 8),
              // _buildSubHeading(
              //   title: 'Penulis Populer',
              //   onTap: () {},
              //   key: const Key('penulis_popular_lainnya'),
              // ),
              // const SizedBox(height: 7),
              // SizedBox(
              //   height: 70,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 9,
              //     itemBuilder: (context, index) {
              //       return WriterList(
              //         key: const Key('penulis_popular_1'),
              //         onTap: () {},
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({
    required String title,
    required Key key,
    required Function() onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: accentColor),
        ),
        InkWell(
          key: key,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text(
                  'Lainnya',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: secdarkColor),
                ),
                //Icon(Icons.keyboard_arrow_right_rounded),
                //Icon(Icons.arrow_right_alt_rounded)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
