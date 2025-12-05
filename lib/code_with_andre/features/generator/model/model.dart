class QuoteModel {
  QuoteModel({required this.id, required this.quote, required this.author});

  final int id;
  final String quote;
  final String author;

  factory QuoteModel.formJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['id'] as int,
      quote: json['quote'] as String,
      author: json['author'] as String,
    );
  }
}

class TestQuote {
  TestQuote({this.id = 0, this.quote = '', this.author = ''});

  int id;
  String quote;
  String author;
}

class TestQuoteTwo {
  TestQuoteTwo({this.id, this.quote, this.author});

  int? id;
  String? quote;
  String? author;
}
