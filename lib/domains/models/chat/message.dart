import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  Message({
    required this.id,
    required this.senderId,
    required this.chatId,
    required this.text,
    required this.seen,
  });

  int id;
  int senderId;
  int chatId;
  String text;
  bool seen;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
