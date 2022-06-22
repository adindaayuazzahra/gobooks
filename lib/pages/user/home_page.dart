import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/pages/user/book_by_year_page.dart';
import 'package:gobooks/pages/user/bookmark_page.dart';
import 'package:gobooks/common/styles.dart';
import 'package:gobooks/pages/user/latest_book_page.dart';
import 'package:gobooks/pages/user/Library_Book_Page.dart';
import 'package:gobooks/widgets/book_by_year_list.dart';
import 'package:gobooks/widgets/latest_book_list.dart';
import 'package:gobooks/widgets/library_book_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final CollectionReference _books =
      FirebaseFirestore.instance.collection('Book');
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
          style: Theme.of(context).textTheme.headline6?.copyWith(
              color: accentColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, BookmarkPage.routeName);
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
                            'Selamat datang di GoBooks',
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
                            'Ayo kembangkan jiwa literasi mulai sekarang.',
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
                      BookByYearList(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return BookByYearPage(
                                minYear: 2010,
                                maxYear: DateTime.now().year,
                              );
                            }),
                          );
                        },
                        numberOfPages: 'Sekarang - 2010',
                      ),
                      BookByYearList(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return BookByYearPage(
                                minYear: 1975,
                                maxYear: 2009,
                              );
                            }),
                          );
                        },
                        numberOfPages: '2000 - 1975',
                      ),
                      BookByYearList(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return BookByYearPage(
                                minYear: 1950,
                                maxYear: 1974,
                              );
                            }),
                          );
                        },
                        numberOfPages: '1974 - 1950',
                      ),
                      BookByYearList(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return BookByYearPage(
                                minYear: 1900,
                                maxYear: 1949,
                              );
                            }),
                          );
                        },
                        numberOfPages: '1949 - 1900',
                      ),
                      BookByYearList(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return BookByYearPage(
                                minYear: 0,
                                maxYear: 1989,
                              );
                            }),
                          );
                        },
                        numberOfPages: '> 1899',
                      ),
                    ],
                  )),
              const SizedBox(height: 5),
              _buildSubHeading(
                title: 'List Buku Perpustakaan',
                onTap: () {
                  Navigator.pushNamed(context, LibraryBookPage.routeName);
                },
                key: const Key('rekomendasi_lainnya'),
              ),
              SizedBox(
                height: 180,
                child: StreamBuilder(
                  stream: _books.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
                          return LibraryBookList(
                              documentSnapshot: documentSnapshot);
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
                  Navigator.pushNamed(context, LatestBookPage.routeName);
                },
                key: const Key('List_terbaru_lainnya'),
              ),
              SizedBox(
                height: 277,
                child: StreamBuilder(
                  stream: _books.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
                          return LatestBookList(
                            key: const Key('latest_book_list_1'),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
