import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

class SearchPage extends StatefulWidget {
  static const ROUTE_NAME = '/search';
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String queries = '';
  final TextEditingController _searchControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          'Pencarian',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: accentColor, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
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
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Card(
            //     elevation: 10,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(25)),
            //     child: Container(
            //       decoration: const BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(25),
            //         ),
            //       ),
            //       child: TextField(
            //         style: const TextStyle(
            //           fontSize: 15.0,
            //           color: Colors.black,
            //         ),
            //         decoration: InputDecoration(
            //           contentPadding: const EdgeInsets.all(10.0),
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(25),
            //             borderSide: const BorderSide(
            //               color: Colors.white,
            //             ),
            //           ),
            //           enabledBorder: OutlineInputBorder(
            //             borderSide: BorderSide(
            //               color: Colors.white,
            //             ),
            //             borderRadius: BorderRadius.circular(25),
            //           ),
            //           hintText: "Search Resto or Menu",
            //           prefixIcon: Icon(
            //             Icons.search,
            //             color: Colors.black,
            //           ),
            //         ),
            //         maxLines: 1,
            //         controller: _searchControl,
            //         onChanged: (String query) {
            //           // if (query.isNotEmpty) {
            //           //   setState(() {
            //           //     queries = query;
            //           //   });
            //           //   state.fetchSearch(query);
            //           // }
            //         },
            //       ),
            //     ),
            //   ),
            // )
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