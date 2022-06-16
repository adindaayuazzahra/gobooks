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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          offset:
                              const Offset(2, 3), // changes position of shadow
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
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: secdarkColor,
                        padding:
                            EdgeInsets.symmetric(vertical: 9, horizontal: 8)),
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
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.7,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListBuku(
                    key: const Key('List_Buku_1'),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
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

class ListBuku extends StatelessWidget {
  final Function() onTap;
  const ListBuku({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        //color: secLightColor,
        elevation: 7,
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/image/cover_book.jpg',
                  fit: BoxFit.cover,
                  //width: size.width * 0.25,
                  width: 80,
                  height: 80,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 130,
                            child: Text(
                              'Pendidikan Matematika Dasar',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: accentColor,
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Penulis',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(fontSize: 12),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'No. Buku : XO983874GH',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),

                    //untuk keterangan dipinjam
                    Column(
                      children: [
                        //Untuk tulisan tersedia dan tidak tersedia
                        Text(
                          'Tersedia',
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.green,
                                    fontSize: 12,
                                  ),
                        ),
                        // Text(
                        //   'Tidak Tersedia',
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .bodyText2
                        //       ?.copyWith(
                        //           fontWeight: FontWeight.w300,
                        //           color: Colors.red,
                        //           fontSize: 12),
                        // ),

                        //tombol edit di arahkan ke halaman input buku untuk mengedit detail buku
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: secdarkColor,
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 10,
                          ),
                          label: Text(
                            'Edit',
                            style: Theme.of(context).textTheme.button?.copyWith(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ],
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
