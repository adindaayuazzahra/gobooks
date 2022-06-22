// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:gobooks/common/styles.dart';
// import 'package:gobooks/widgets/history_bookmark_list.dart';
//
// import '../../widgets/booklist.dart';
//
// class HistoryPage extends StatefulWidget {
//   static const routeName = '/history';
//   const HistoryPage({Key? key}) : super(key: key);
//
//   @override
//   State<HistoryPage> createState() => _HistoryPageState();
// }
//
// class _HistoryPageState extends State<HistoryPage> {
//   String queries = '';
//   final TextEditingController _searchControl = TextEditingController();
//   final CollectionReference _books = FirebaseFirestore.instance.collection('Book');
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: bgColor,
//       appBar: AppBar(
//         elevation: 0,
//         // leading: IconButton(
//         //   onPressed: () {
//         //     Navigator.pop(context);
//         //   },
//         //   icon: Icon(
//         //     Icons.arrow_back,
//         //     color: Colors.black,
//         //   ),
//         // ),
//         title: Text(
//           'Riwayat Peminjaman',
//           style: Theme.of(context)
//               .textTheme
//               .headline6
//               ?.copyWith(color: accentColor, fontSize: 23),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
//               child: Container(
//                 margin: const EdgeInsets.symmetric(vertical: 10),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(30),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.3),
//                       spreadRadius: 1,
//                       blurRadius: 3,
//                       offset: const Offset(2, 3), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: TextField(
//                   cursorColor: Colors.black,
//                   decoration: const InputDecoration(
//                     icon: Icon(
//                       Icons.search_rounded,
//                       color: secdarkColor,
//                     ),
//                     hintText: "Cari Judul/Penulis/Kategiori",
//                     border: InputBorder.none,
//                   ),
//                   onChanged: (String value) {},
//                 ),
//               ),
//             ),
//             StreamBuilder(
//               stream: _books.snapshots(),
//               builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//                 final List<int> listOfBooked = <int>[];
//                 if (streamSnapshot.hasData) {
//                   streamSnapshot.data!.docs.asMap().forEach((index, value) {
//                     if(value['history'] == true){
//                       listOfBooked.add(index);
//                     }
//                   });
//                   return ListView.builder(
//                     scrollDirection: Axis.vertical,
//                     itemCount: listOfBooked.length,
//                     itemBuilder: (context, index) {
//                       final DocumentSnapshot documentSnapshot = streamSnapshot
//                           .data!.docs[listOfBooked[index]];
//                       return BookList(
//                           documentSnapshot: documentSnapshot);
//                       },
//                   );
//                 }
//                 // return HistoryBookmarkList(
//                 //   documentSnapshot: documentSnapshot
//                 // );
//                 return const Center(
//                   child: CircularProgressIndicator(color: accentColor),
//                 );
//               },
//             ),
//             // SizedBox(
//             //   height: size.height * 0.7,
//             //   child: ListView.builder(
//             //     itemCount: 10,
//             //     shrinkWrap: true,
//             //     itemBuilder: (context, index) {
//             //       return HistoryBookmarkList(
//             //         key: const Key('history_list_1'),
//             //         onTap: () {},
//             //       );
//             //     },
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _searchControl.dispose();
//     super.dispose();
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gobooks/widgets/bookmark_list.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

import '../../widgets/booklist.dart';
import 'history_list.dart';

class HistoryPage extends StatelessWidget {
  static const ROUTE_NAME = '/bookmark';
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionReference _books =
        FirebaseFirestore.instance.collection('Book');
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Riwayat Peminjaman',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: accentColor, fontSize: 22),
        ),
      ),
      body: StreamBuilder(
        stream: _books.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          final List<int> listOfBooked = <int>[];
          if (streamSnapshot.hasData) {
            streamSnapshot.data!.docs.asMap().forEach((index, value) {
              if (value['history'] == true) {
                listOfBooked.add(index);
              }
            });
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listOfBooked.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[listOfBooked[index]];
                return HistoryList(documentSnapshot: documentSnapshot);
              },
            );
          }
          return const Center(
              child: CircularProgressIndicator(color: accentColor));
        },
      ),
    );
  }
}
