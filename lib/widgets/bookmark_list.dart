import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

class BookmarkList extends StatelessWidget {
  final Function() onTap;
  const BookmarkList({
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
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/image/cover_book.jpg',
                    fit: BoxFit.cover,
                    //width: size.width * 0.25,
                    width: 80,
                    height: 80,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 130,
                              child: Text(
                                'Pendidikan Matematika Dasar',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: accentColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text('Penulis',
                                style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      ),

                      // Untuk tulisan tersedia dan tidak tersedia
                      // Text(
                      //   'Tersedia',
                      //   style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      //         fontWeight: FontWeight.w300,
                      //         color: Colors.green,
                      //         fontSize: 12,
                      //       ),
                      // ),
                      Text(
                        'Tidak Tersedia',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.w300,
                            color: Colors.red,
                            fontSize: 12),
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