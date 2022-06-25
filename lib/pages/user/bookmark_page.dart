import 'package:gobooks/main.dart';

class BookmarkPage extends StatelessWidget {
  static const routeName = '/bookmark';
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionReference _books =
        FirebaseFirestore.instance.collection('Book');

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
            size: 25,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Bookmark',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: accentColor, fontSize: 25),
        ),
      ),
      body: StreamBuilder(
        stream: _books.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          final List<int> listOfBookmarked = <int>[];
          if (streamSnapshot.hasData) {
            streamSnapshot.data!.docs.asMap().forEach((index, value) {
              if (value['isBookmarked'] == true) {
                listOfBookmarked.add(index);
              }
            });
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listOfBookmarked.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[listOfBookmarked[index]];
                return BookmarkList(
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