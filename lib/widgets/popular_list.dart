import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

class PopularList extends StatelessWidget {
  final Function() onTap;
  const PopularList({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 7,
        margin: const EdgeInsets.fromLTRB(6, 13, 10, 13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/image/cover_book.jpg',
                  fit: BoxFit.cover,
                  width: 110,
                  height: 140,
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 110,
                child: Text(
                  'Pendidikan Matematika dasar',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                    fontSize: 14,
                  ),
                ),
              ),
              Text(
                'Penulis',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontSize: 13),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}