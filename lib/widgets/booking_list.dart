import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

class BookingList extends StatelessWidget {
  final Function() onTap;
  final String imageUrl;
  final String bookTitle;
  final String bookLocation;


  const BookingList({
    Key? key,
    required this.onTap,
    required this.imageUrl,
    required this.bookTitle,
    required this.bookLocation
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      //width: 315,
      //width: size.width * 0.88,
      InkWell(
        onTap: onTap,
        child: Card(
          elevation: 7,
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 13),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(8),
                //   child: Image.asset(
                //     imageUrl,
                //     fit: BoxFit.cover,
                //     width: 10,
                //   ),
                // ),
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
                                bookTitle,
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
                            const SizedBox(height: 4),
                            Text(
                              'Lokasi Rak : $bookLocation',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),

                      // Untuk Keterangan tepat waktu
                      // Text(
                      //   'Tepat Waktu',
                      //   style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      //         fontWeight: FontWeight.w300,
                      //         color: Colors.green,
                      //         fontSize: 12,
                      //       ),
                      // ),

                      //untuk keterangan terlambat
                      // Text(
                      //   'Terlambat',
                      //   style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      //       fontWeight: FontWeight.w300,
                      //       color: Colors.red,
                      //       fontSize: 12),
                      // ),

                      //untuk keterangan dipinjam
                      Text(
                        'Dipinjam',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
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