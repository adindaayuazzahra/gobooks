import 'package:gobooks/widgets/bookmark_list.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

class BookmarkPage extends StatelessWidget {
  static const ROUTE_NAME = '/bookmark';
  const BookmarkPage({Key? key}) : super(key: key);

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
          icon: const Icon(
            Icons.arrow_back_ios,
            color: accentColor,
            size: 25,
          ),
        ),
        title: Text(
          'Bookmark',
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
          return BookmarkList(
            key: const Key('bookmark_list'),
            onTap: () {},
          );
        },
      ),
    );
  }
}
