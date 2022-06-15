import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';
import 'package:date_field/date_field.dart';

class InputBook extends StatefulWidget {
  const InputBook({Key? key}) : super(key: key);

  @override
  _InputBookState createState() => _InputBookState();
}

class _InputBookState extends State<InputBook> {
  // final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
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
                      validator: (value) {
                        if (value == null) {
                          return 'Judul Tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Rating Buku",
                        icon: const Icon(Icons.star_border),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Rating tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),

                  // Hanya jam
                  // DateTimeFormField(
                  //   decoration: const InputDecoration(
                  //     hintStyle: TextStyle(color: Colors.black45),
                  //     errorStyle: TextStyle(color: Colors.redAccent),
                  //     border: OutlineInputBorder(),
                  //     suffixIcon: Icon(Icons.event_note),
                  //     labelText: 'Only time',
                  //   ),
                  //   mode: DateTimeFieldPickerMode.time,
                  //   autovalidateMode: AutovalidateMode.always,
                  //   validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  //   onDateSelected: (DateTime value) {
                  //     print(value);
                  //   },
                  // ),

                  // Tanggal dan waktu
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DateTimeField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.date_range),
                          hintText: 'Tanggal',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                        selectedDate: selectedDate,
                        onDateSelected: (DateTime value) {
                          setState(() {
                            selectedDate = value;
                          });
                        }),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "URL Buku",
                        icon: const Icon(Icons.link),
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
                          color: accentColor,
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
