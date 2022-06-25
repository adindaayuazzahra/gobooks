import 'package:gobooks/main.dart';

class HistoryPage extends StatelessWidget {
  static const routeName = '/bookmark';
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
