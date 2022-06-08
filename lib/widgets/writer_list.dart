import 'package:flutter/material.dart';

class WriterList extends StatelessWidget {
  final Function() onTap;
  const WriterList({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 7),
        child: ClipOval(
          child: Image.asset(
            'assets/image/cover_book.jpg',
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}