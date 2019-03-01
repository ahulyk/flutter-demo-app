import 'package:json_annotation/json_annotation.dart';

part 'ItemModel.g.dart';

@JsonSerializable()
class ItemModel {
  int userId;
  int id;
  String title;
  String body;

  ItemModel(this.userId, this.id, this.title, this.body);

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

}
