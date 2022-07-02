import 'package:gobooks/main.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);
  static const routeName = '/history_page';

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final CollectionReference _books = FirebaseFirestore
        .instance.collection('Book');
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: bgColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: const TabBar(
              indicatorColor: accentColor,
              tabs: [
                Tab(
                    icon: Text('Masih dipinjam',
                        style: TextStyle(
                            color: secdarkColor,
                            fontWeight: FontWeight.bold)
                    )
                ),
                Tab(
                    icon: Text('Sudah dikembalikan',
                        style: TextStyle(
                            // color: accentColor,
                            color: secdarkColor,
                            fontWeight: FontWeight.bold)
                    )
                ),
              ],
            ),
            title: Text(
              'Riwayat Peminjaman',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: accentColor, fontSize: 22),
            ),
            centerTitle: true,
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: TabBarView(
              children: [
                Tab(
                  child: StreamBuilder(
                    stream: _books.snapshots(),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      final List<int> listOfBooked = <int>[];
                      if (streamSnapshot.hasData) {
                        streamSnapshot.data!.docs
                            .asMap()
                            .forEach((index, value) {
                          if (value['history'] == true && value['isAvailable'] == false) {
                            listOfBooked.add(index);
                          }
                        });
                        return listOfBooked.isNotEmpty
                            ? ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: listOfBooked.length,
                                itemBuilder: (context, index) {
                                  final DocumentSnapshot documentSnapshot =
                                      streamSnapshot.data!.docs[listOfBooked[index]];
                                  return HistoryList(documentSnapshot: documentSnapshot);
                                })
                            : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.menu_book,
                                    color: secLightColor,
                                    size: 50,
                                  ),
                                  Text('Belum ada buku yang dipinjam',
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
                          child: CircularProgressIndicator(color: accentColor));
                    },
                  ),
                ),
                Tab(
                  child: StreamBuilder(
                    stream: _books.snapshots(),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      final List<int> listOfBooked = <int>[];
                      if (streamSnapshot.hasData) {
                        streamSnapshot.data!.docs
                            .asMap()
                            .forEach((index, value) {
                          if (value['history'] == true && value['isAvailable'] == true) {
                            listOfBooked.add(index);
                          }
                        });
                        return listOfBooked.isNotEmpty
                            ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: listOfBooked.length,
                              itemBuilder: (context, index) {
                                final DocumentSnapshot documentSnapshot =
                                    streamSnapshot.data!.docs[listOfBooked[index]];

                                return HistoryList(documentSnapshot: documentSnapshot);
                              })
                            : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.menu_book,
                                    color: Colors.green,
                                    size: 50,
                                  ),
                                  Text('Belum ada buku yang dikembalikan',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(color: Colors.green,
                                        fontSize: 15
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              )
                          );
                      }
                      return const Center(
                          child: CircularProgressIndicator(color: accentColor));
                    },
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
