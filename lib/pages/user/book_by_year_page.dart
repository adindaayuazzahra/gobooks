import 'package:gobooks/main.dart';

class BookByYearPage extends StatelessWidget {
  final CollectionReference _books =
      FirebaseFirestore.instance.collection('Book');
  static const routeName = '/bookByYearPage';

  final int minYear;
  final int maxYear;

  BookByYearPage({
    Key? key,
    required this.minYear,
    required this.maxYear
  }) : super(key: key);

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
        title: maxYear > 1899
            ? Text('$maxYear - $minYear',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: accentColor, fontSize: 25))
            : Text('> 1899',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: accentColor, fontSize: 25)),
      ),
      body: StreamBuilder(
        stream: _books.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          final List<int> yearNumber = <int>[];
          if (streamSnapshot.hasData) {
            streamSnapshot.data!.docs.asMap().forEach((index, value) {
              if (value['yearPublished'] >= minYear &&
                  value['yearPublished'] <= maxYear) {
                yearNumber.add(index);
              }
            });
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: yearNumber.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[yearNumber[index]];
                return BookByYearList(
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