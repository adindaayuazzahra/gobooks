import 'package:flutter/material.dart';
import 'package:gobooks/styles.dart';

class HistoryPage extends StatefulWidget {
  static const routeName = '/history';
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String queries = '';
  final TextEditingController _searchControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
        title: Text(
          'Riwayat Peminjaman',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: accentColor, fontSize: 23),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.search_rounded,
                      color: secdarkColor,
                    ),
                    hintText: "Cari Judul/Penulis/Kategiori",
                    border: InputBorder.none,
                  ),
                  onChanged: (String value) {},
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.7,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BookmarkList(
                    key: const Key('rekomen_list_1'),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
      //),
    );
  }

  @override
  void dispose() {
    _searchControl.dispose();
    super.dispose();
  }
}

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
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 13),
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
                          SizedBox(height: 4),
                          Text(
                            'Batas Pinjam 2/12/22',
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
