class BookModel {
  BookModel({
    required this.id,
    required this.bookAuthor,
    required this.bookTitle,
    required this.isAvailable,
    required this.releaseDate,
    required this.synopsis,
    required this.bookLocation,
    required this.publisher,
    required this.rating,
    required this.bookUrl,
  });
  bool isAvailable;
  String bookTitle;
  String id;
  String bookAuthor;
  double rating;
  String publisher;
  String bookLocation;
  String releaseDate;
  String synopsis;
  String bookUrl;

  Map<String, dynamic> toJson() => {
        'id': id,
        'bookTitle': bookTitle,
        'bookAuthor': bookAuthor,
        'releaseDate': releaseDate,
        'rating': rating,
        'publisher': publisher,
        'bookLocation': bookLocation,
        'synopsis': synopsis,
        'isAvailable': isAvailable,
        'bookUrl': bookUrl,
      };
  static BookModel fromJson(Map<String, dynamic> json) => BookModel(
        id: json['id'],
        bookAuthor: json['bookAuthor'],
        bookTitle: json['bookTitle'],
        isAvailable: json['isAvailable'],
        releaseDate: json['releaseData'],
        synopsis: json['synopsis'],
        publisher: json['publisher'],
        rating: json['rating'],
        bookLocation: json['bookLocation'],
        bookUrl: json['bookUrl'],
      );
}
