import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

class InputBook extends StatefulWidget {
  const InputBook({Key? key}) : super(key: key);

  @override
  _InputBookState createState() => _InputBookState();
}

class _InputBookState extends State<InputBook> {
  // final _formKey = GlobalKey<FormState>();

  bool status = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      // backgroundColor: bgColor,
      // appBar: AppBar(
      //   // leading: IconButton(
      //   //   icon: Icon(Icons.menu_sharp),
      //   //   color: Colors.black,
      //   //   //onPressed: () {},
      //   //   onPressed: _openDrawer,
      //   // ),
      //   // leading: IconButton(
      //   //   onPressed: () {
      //   //     Navigator.pop(context);
      //   //   },
      //   //   icon: const Icon(
      //   //     Icons.arrow_back_ios,
      //   //     color: accentColor,
      //   //     size: 25,
      //   //   ),
      //   // ),
      //   centerTitle: true,
      //   title: Text(
      //     'Dashboard',
      //     style: Theme.of(context).textTheme.headline6?.copyWith(
      //         color: accentColor, fontSize: 25, fontWeight: FontWeight.bold),
      //   ),
      //   backgroundColor: Colors.blue.withOpacity(0),
      //   elevation: 0.0,
      // ),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        height: size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Form(
          // key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "ID Buku",
                        icon: const Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Judul Tidak boleh kosong';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Judul Buku",
                        icon: const Icon(Icons.book),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Judul Tidak boleh kosong';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Author",
                        icon: const Icon(Icons.people),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Judul Tidak boleh kosong';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Penerbit Buku",
                        icon: const Icon(Icons.published_with_changes),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Judul Tidak boleh kosong';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Letak Buku",
                        icon: const Icon(Icons.library_books_sharp),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Judul Tidak boleh kosong';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  SwitchListTile(
                    title: Text('Status : ${_status(status)}'),
                    value: status,
                    activeColor: secdarkColor,
                    onChanged: (value) {
                      setState(() {
                        status = value;
                      });
                    },
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        width: size.width * 0.35,
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: secdarkColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(2, 3),
                            ),
                          ],
                        ),
                        child: const Text(
                          'Input',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _status(bool value) {
    return value == true ? 'Tersedia' : 'Tidak tersedia';
  }
}
