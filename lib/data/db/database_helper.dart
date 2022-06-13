import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gobooks/data/book_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;
@override
Future createBook({BookModel? books}) async {
  final docBook = FirebaseFirestore.instance.collection('Book').doc();
  books!.id = docBook.id;
  final json = books.toJson();
  await docBook.set(json);
}
//streambuilder<List<bookModel>>{ //data not change futurebuilder
//builder(context, snapshot)}

//how to load using futurebuilder>
//read data all
Stream<List<BookModel>> readBooks() => FirebaseFirestore.instance
    .collection('Book')
    .snapshots()
    .map((e) => e.docs.map((e) => BookModel.fromJson(e.data())).toList());
// read single data
Future<BookModel?> readSingleBook() async {
  final docBook =
      FirebaseFirestore.instance.collection('Book').doc('a'); // .doc($document)
  final snapshot = await docBook.get();
  if (snapshot.exists) {
    return BookModel.fromJson(snapshot.data()!);
  }
}

Future<void> uploadFile(String filePath, String fileName) async {
  File file = File(filePath);
  try {
    await storage.ref('').putFile(file);
  } on FirebaseException catch (e) {
    print(e);
  }
}

Future<void> listFiles() async {
  ListResult results = await storage.ref('').listAll();
  results.items.forEach((Reference ref) {
    print('found file:$ref');
  });
  return null;
}

Future<void> uploadPict() async {
  final results = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png']);
  final path = results?.files.single.path!;
  final fileName = results?.files.single.name;
  print(path);
  print(fileName);
}
