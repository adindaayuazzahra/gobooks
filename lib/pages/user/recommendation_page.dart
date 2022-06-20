import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';
import 'package:gobooks/widgets/booklist.dart';

class RecommendationPage extends StatefulWidget {
  static const ROUTE_NAME = '/rekomendasi_page';
  const RecommendationPage({Key? key}) : super(key: key);

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
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
          'Rekomendasi',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: accentColor, fontSize: 25),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return BookList(
            key: const Key('bookmark_list'),
            onTap: () {},
          );
        },
      ),
    );
  }
}
