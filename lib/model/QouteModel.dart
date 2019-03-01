import 'package:json_annotation/json_annotation.dart';

part 'QouteModel.g.dart';

@JsonSerializable()
class QuoteWrapper {
  @JsonKey(nullable: false)
  Quote quote;

  QuoteWrapper(this.quote);

  factory QuoteWrapper.fromJson(Map<String, dynamic> json) =>
      _$QuoteWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteWrapperToJson(this);
}

@JsonSerializable()
class Quote {
  String author;
  String body;

  Quote(this.author, this.body);

  String quoteFormatted() {
    return "$body\nby $author";
  }

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}
