import 'package:gobooks/main.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/searchPage';
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final CollectionReference _books =
      FirebaseFirestore.instance.collection('Book');
  final TextEditingController _searchControl = TextEditingController();
  String queries = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 120,
          elevation: 0,
          title: Text(
            'Pencarian\n\n',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: accentColor, fontSize: 25),
          ),
          flexibleSpace: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
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
                          offset: const Offset(2, 3),
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
                        hintText: "Cari Judul atau Penulis",
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          queries = value;
                        });
                      },
                    ),
                  ),
                ),
              ]
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
                    if (queries.isEmpty) {
                      return const Center();
                    }
                    if (documentSnapshot['bookTitle']
                            .toString()
                            .toLowerCase()
                            .contains(queries.toLowerCase()) ||
                        documentSnapshot['bookTitle']
                            .toString()
                            .toLowerCase()
                            .startsWith(queries.toLowerCase())) {
                      return BookList(documentSnapshot: documentSnapshot);
                    } else if (documentSnapshot['bookAuthor']
                            .toString()
                            .toLowerCase()
                            .contains(queries.toLowerCase()) ||
                        documentSnapshot['bookTitle']
                            .toString()
                            .toLowerCase()
                            .startsWith(queries.toLowerCase())) {
                      return BookList(documentSnapshot: documentSnapshot);
                    } else {
                      return const Center();
                    }
                  });
            }
            return const Center(
              child: CircularProgressIndicator(color: accentColor),
            );
          },
        )
    );
  }

  @override
  void dispose() {
    _searchControl.dispose();
    super.dispose();
  }
}
