import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

class ListPeminjaman extends StatefulWidget {
  const ListPeminjaman({Key? key}) : super(key: key);

  @override
  State<ListPeminjaman> createState() => _ListPeminjamanState();
}

class _ListPeminjamanState extends State<ListPeminjaman> {
  String queries = '';
  final TextEditingController _searchControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
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
                    hintText: "Cari nomor booking",
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
                  return Container();
                  // return HistoryBookmarkList(
                  //   key: const Key('rekomen_list_1'),
                  //   onTap: () {},
                  // );
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
