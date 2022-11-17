class Quotes {
  final String quote;
  final String author;
  final String image;

  Quotes({
    required this.quote,
    required this.author,
    required this.image,
  });

  factory Quotes.fromJSON(Map<String, dynamic> data, String image) {
    return Quotes(
        quote: data['content'], author: data['author'], image: image);
  }
}

class QuotesDB {
  final String quote;
  final String author;
  final String image;

  QuotesDB({
    required this.quote,
    required this.author,
    required this.image,
  });

  factory QuotesDB.fromAPI(Map<String, dynamic> data) {
    return QuotesDB(
        quote: data['quote'], author: data['author'], image: data['image']);
  }
}
