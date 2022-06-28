import 'package:gobooks/main.dart';

class BookByYearPage extends StatelessWidget {
  static const routeName = '/bookByYearPage';

  final int minYear;
  final int maxYear;

  const BookByYearPage({
    Key? key,
    required this.minYear,
    required this.maxYear
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final CollectionReference _books = FirebaseFirestore
        .instance.collection('Book');

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
              if (value['yearPublished'] != null && value['yearPublished'] >= minYear &&
                  value['yearPublished'] != null && value['yearPublished'] <= maxYear) {
                yearNumber.add(index);
              }
            });
            return yearNumber.isNotEmpty
                ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: yearNumber.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[yearNumber[index]];
                        return BookByYearList(
                          documentSnapshot: documentSnapshot,
                        );
                      },
                    )
                : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.menu_book,
                            color: secLightColor,
                            size: 50,
                          ),
                          Text('Tidak ada buku yang dipublikasi \n'
                              'dari tahun $maxYear - $minYear',
                              style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: secLightColor,
                                  fontSize: 15
                              ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      )
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