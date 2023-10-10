
class QuoteModel {
  String quote;
  String author;
  String category;

  QuoteModel({
    required this.quote,
    required this.author,
    required this.category,
  });

  factory QuoteModel.fromJson({required Map<String, dynamic> json}) => QuoteModel(
    quote: json["quote"],
    author: json["author"],
    category: json["category"],
  );

}