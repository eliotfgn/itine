import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  Category(
      {required this.id,
      required this.name,
      required this.image,
      required this.count});

  final int id;
  final String name;
  final String? image;
  final int count;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
