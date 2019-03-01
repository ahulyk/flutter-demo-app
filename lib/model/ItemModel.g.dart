// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) {
  return ItemModel(json['userId'] as int, json['id'] as int,
      json['title'] as String, json['body'] as String);
}

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body
    };
