import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

class BookByYearList extends StatelessWidget {
  final Function() onTap;
  final String numberOfPages;

  const BookByYearList({
    Key? key,
    required this.onTap,
    required this.numberOfPages
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 4, left: 6, bottom: 7, top: 7),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(2, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            const Icon(
                Icons.date_range,
                color: accentColor
            ),
            const SizedBox(width: 3),
            Text(
              numberOfPages,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}