import 'package:gobooks/main.dart';

class LibraryBookPage extends StatelessWidget {
  const LibraryBookPage({Key? key}) : super(key: key);
  static const routeName = '/library_book_page';

  @override
  Widget build(BuildContext context) {
    final CollectionReference _books = FirebaseFirestore
        .instance.collection('Book');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: accentColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          'List Buku Perpustakaan',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: accentColor, fontSize: 18),
        ),
      ),
      body: StreamBuilder(
        stream: _books.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  flex: 20,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                      return BookList(
                        documentSnapshot: documentSnapshot,
                      );
                    },
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
                      width: size.width * 0.90,
                      child: Text(
                        'Jumlah buku : ${streamSnapshot.data!.docs.length}',
                        style: const TextStyle(
                          // color: accentColor,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: accentColor),
          );
        },
      ),
    );
  }
}
