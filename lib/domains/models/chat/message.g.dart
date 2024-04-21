// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as int,
      senderId: json['senderId'] as int,
      chatId: json['chatId'] as int,
      text: json['text'] as String,
      seen: json['seen'] as bool,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'chatId': instance.chatId,
      'text': instance.text,
      'seen': instance.seen,
    };
