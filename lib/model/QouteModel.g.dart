// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QouteModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteWrapper _$QuoteWrapperFromJson(Map<String, dynamic> json) {
  return QuoteWrapper(Quote.fromJson(json['quote'] as Map<String, dynamic>));
}

Map<String, dynamic> _$QuoteWrapperToJson(QuoteWrapper instance) =>
    <String, dynamic>{'quote': instance.quote};

Quote _$QuoteFromJson(Map<String, dynamic> json) {
  return Quote(json['author'] as String, json['body'] as String);
}

Map<String, dynamic> _$QuoteToJson(Quote instance) =>
    <String, dynamic>{'author': instance.author, 'body': instance.body};
