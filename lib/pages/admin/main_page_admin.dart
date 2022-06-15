import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';
import 'package:gobooks/pages/admin/Daftar_Peminjaman_page.dart';
import 'package:gobooks/pages/admin/input_book_page.dart';

class MainPageAdmin extends StatefulWidget {
  const MainPageAdmin({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/input_buku';
  @override
  State<MainPageAdmin> createState() => _MainPageAdminState();
}

class _MainPageAdminState extends State<MainPageAdmin> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          color: Colors.black,
          onPressed: _openDrawer,
        ),
        title: Text(
          'Dashboard',
          style: Theme.of(context).textTheme.headline6?.copyWith(
              color: accentColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
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
                      offset: const Offset(2, 3), // changes position of shadow
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
                    hintText: "Cari ID Buku",
                    border: InputBorder.none,
                  ),
                  onChanged: (String value) {},
                ),
              ),
              const SizedBox(height: 5),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: secdarkColor,
                    padding: EdgeInsets.symmetric(vertical: 9, horizontal: 8)),
                onPressed: () {
                  Navigator.pushNamed(context, InputBook.ROUTE_NAME);
                },
                icon: Icon(
                  Icons.add_rounded,
                  size: 20,
                ),
                label: Text('Tambah Buku',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.white)),
              ),
              SizedBox(
                height: size.height * 0.7,
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container();
                    // return HistoryBookmarkList(
                    //   key: const Key('rekomen_list_1'),
                    //   onTap: () {},
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      //drawer
      drawer: Drawer(
        child: Material(
          color: accentColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: secLightColor),
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Row(
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Colors.transparent,
                        child: Image.asset(
                          'assets/image/profil.png',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Admin',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'admin@gmail.com',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: secdarkColor,
                              padding: EdgeInsets.all(7)),
                          onPressed: () {},
                          icon: Icon(
                            Icons.logout_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                          label: Text(
                            'Log Out',
                            style: Theme.of(context).textTheme.button?.copyWith(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                          ),
                        ),
                        // InkWell(
                        //   onTap: () {},
                        //   child: Container(
                        //     padding: EdgeInsets.all(5),
                        //     height: 40,
                        //     width: 130,
                        //     alignment: Alignment.center,
                        //     decoration: BoxDecoration(
                        //       color: secdarkColor,
                        //       borderRadius: BorderRadius.circular(8),
                        //     ),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Icon(
                        //           Icons.logout_rounded,
                        //           color: Colors.white,
                        //           size: 20,
                        //         ),
                        //         const SizedBox(width: 4),
                        //         Text(
                        //           'Log Out',
                        //           style: Theme.of(context)
                        //               .textTheme
                        //               .button
                        //               ?.copyWith(
                        //                 fontSize: 14,
                        //                 color: Colors.white,
                        //               ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 16),
                    ListTile(
                      leading: Icon(
                        Icons.menu_book_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Daftar Buku',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 16),
                    ListTile(
                      leading: Icon(
                        Icons.group,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Daftar Peminjaman',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, PeminjamanPage.ROUTE_NAME);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
