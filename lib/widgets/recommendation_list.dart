import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

class RecommendationList extends StatelessWidget {
  final Function() onTap;
  const RecommendationList({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      //width: 315,
      //width: size.width * 0.88,
      InkWell(
        onTap: onTap,
        child: Card(
          //color: secLightColor,
          elevation: 7,
          margin: const EdgeInsets.fromLTRB(6, 13, 10, 13),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    'assets/image/cover_book.jpg',
                    fit: BoxFit.cover,
                    //width: size.width * 0.25,
                    width: 90,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Text(
                          'Pendidikan Matematika Dasar',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: accentColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text('Penulis',
                          style: Theme.of(context).textTheme.bodyText2),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            '5.0',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
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