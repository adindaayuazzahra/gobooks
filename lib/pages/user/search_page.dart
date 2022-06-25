import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';
import 'package:firebase_core/firebase_core.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';
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

          title: /*(Text(
            'Pencarian',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: accentColor, fontSize: 25),
          ), 
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
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
                  hintText: "Cari Judul/Penulis/Kategori",
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  queries = value;
                },
              ),
            ),
          ),
        ),*/
              Card(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'search',
                iconColor: Colors.black,
              ),
              onChanged: (val) {
                setState(() {
                  queries = val;
                });
              },
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Book').snapshots(),
          builder: (context, snapshots) {
            return ListView.builder(
              itemBuilder: (context, index) {
                var data =
                    snapshots.data!.docs[index].data() as Map<String, dynamic>;
                if (queries.isEmpty) {
                  return ListTile(
                    title: Text(
                      data['bookTitle'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      data['bookAuthor'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }
                if (data['bookTitle']
                        .toString()
                        .toLowerCase()
                        .contains(queries.toLowerCase()) ||
                    data['bookTitle']
                        .toString()
                        .toLowerCase()
                        .startsWith(queries.toLowerCase())) {
                  return ListTile(
                    title: Text(
                      data['bookTitle'].toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      data['bookLocation'].toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: Image.network(data['bookUrl'].toString()),
                  );
                }
                return Container();
              },
              itemCount: snapshots.data!.docs.length,
            );
          },
        )

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

        );
  }

  @override
  void dispose() {
    _searchControl.dispose();
    super.dispose();
  }
}
