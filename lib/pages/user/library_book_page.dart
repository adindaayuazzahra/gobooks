import 'package:gobooks/main.dart';

class LibraryBookPage extends StatefulWidget {
  static const routeName = '/library_book_page';
  const LibraryBookPage({Key? key}) : super(key: key);

  @override
  State<LibraryBookPage> createState() => _LibraryBookPageState();
}

class _LibraryBookPageState extends State<LibraryBookPage> {
  final CollectionReference _books =
      FirebaseFirestore.instance.collection('Book');

  @override
  Widget build(BuildContext context) {
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
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          'List Buku Perpustakaan',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: accentColor, fontSize: 20),
        ),
      ),
      body: StreamBuilder(
        stream: _books.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return BookList(
                  documentSnapshot: documentSnapshot,
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: Colors.red),
          );
        },
      ),
    );
  }
}
