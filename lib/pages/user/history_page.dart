import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';
import 'package:gobooks/widgets/history_bookmark_list.dart';

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
                  return HistoryBookmarkList(
                    key: const Key('history_list_1'),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchControl.dispose();
    super.dispose();
  }
}
