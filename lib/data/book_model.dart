class BookModel {
  BookModel({
    required this.id,
    required this.author,
    required this.bookname,
    required this.isBooked,
    required this.releaseDate,
    required this.sinopsis,
  });
  bool isBooked;
  String bookname;
  String id;
  String author;
  String? releaseDate;
  String? sinopsis;

  Map<String, dynamic> toJson() => {
        'id': id,
        'bookName': bookname,
        'author': author,
        'releaseDate': releaseDate,
        'sinopsis': sinopsis,
        'isBooked': isBooked,
      };
  static BookModel fromJson(Map<String, dynamic> json) => BookModel(
        id: json['id'],
        author: json['author'],
        bookname: json['bookName'],
        isBooked: json['isBooked'],
        releaseDate: json['releaseData'],
        sinopsis: json['sinopsis'],
      );
}
