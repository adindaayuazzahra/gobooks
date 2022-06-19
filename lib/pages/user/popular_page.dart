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
