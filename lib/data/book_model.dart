class BookModel {
  BookModel({
    required this.id,
    required this.author,
    required this.bookName,
    required this.isBooked,
    required this.releaseDate,
    required this.synopsis,
  });
  bool isBooked;
  String bookName;
  String id;
  String author;
  String? releaseDate;
  String? synopsis;

  Map<String, dynamic> toJson() => {
        'id': id,
        'bookName': bookName,
        'author': author,
        'releaseDate': releaseDate,
        'synopsis': synopsis,
        'isBooked': isBooked,
      };
  static BookModel fromJson(Map<String, dynamic> json) => BookModel(
        id: json['id'],
        author: json['author'],
        bookName: json['bookName'],
        isBooked: json['isBooked'],
        releaseDate: json['releaseData'],
        synopsis: json['synopsis'],
      );
}
