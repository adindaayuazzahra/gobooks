import 'package:gobooks/main.dart';

class LatestBookPage extends StatefulWidget {
  static const routeName = '/latest_book_page';
  const LatestBookPage({Key? key}) : super(key: key);

  @override
  State<LatestBookPage> createState() => _LatestBookPageState();
}

class _LatestBookPageState extends State<LatestBookPage> {
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
          'Buku Terbaru',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: accentColor, fontSize: 25),
        ),
      ),
      body: StreamBuilder(
        stream: _books.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          final List<int> yearNumber = <int>[];
          if (streamSnapshot.hasData) {
            streamSnapshot.data!.docs.asMap().forEach((index, value) {
              if (value['yearPublished'] >= 2020) {
                yearNumber.add(index);
              }
            });
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: yearNumber.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[yearNumber[index]];
                return BookList(
                  documentSnapshot: documentSnapshot,
                );
              },
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