import 'package:flutter/material.dart';
import 'package:gobooks/pages/bookmark_page.dart';
import 'package:gobooks/common/styles.dart';
import 'package:gobooks/pages/detail_buku.dart';
import 'package:gobooks/widgets/category_list.dart';
import 'package:gobooks/widgets/popular_list.dart';
import 'package:gobooks/widgets/recommendation_list.dart';
import 'package:gobooks/widgets/writer_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
              Navigator.pushNamed(context, BookmarkPage.ROUTE_NAME);
            },
            icon: const Icon(
              Icons.bookmark_outline_rounded,
              color: Colors.black,
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
              ),
              _buildSubHeading(
                title: 'Kategori',
                onTap: () {},
                key: const Key('kategori_lainnya'),
              ),
              SizedBox(
                height: size.height * 0.075,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return CategoryList(
                      key: const Key('kategori_list_1'),
                      onTap: () {},
                    );
                  },
                ),
              ),
              const SizedBox(height: 5),
              _buildSubHeading(
                title: 'Rekomendasi Buku',
                onTap: () {},
                key: const Key('rekomendasi_lainnya'),
              ),
              SizedBox(
                height: 180,
                //height: size.height * 0.23,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return RecommendationList(
                      key: const Key('rekomen_list_1'),
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            // return const MainPage();
                            return const DetailPage();
                          },
                        ),
                      );},
                    );
                  },
                ),
              ),
              _buildSubHeading(
                title: 'Buku Popular',
                onTap: () {},
                key: const Key('popular_lainnya'),
              ),
              SizedBox(
                height: 277,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return PopularList(
                      key: const Key('popular_list_1'),
                      onTap: () {},
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              _buildSubHeading(
                title: 'Penulis Populer',
                onTap: () {},
                key: const Key('penulis_popular_lainnya'),
              ),
              const SizedBox(height: 7),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return WriterList(
                      key: const Key('penulis_popular_1'),
                      onTap: () {},
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