// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => UserRequest(
      json['firstName'] as String,
      json['lastName'] as String,
      json['email'] as String,
      json['password'] as String,
      json['country'] as String,
      json['town'] as String,
      json['phoneNumber'] as int,
    );

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'password': instance.password,
      'email': instance.email,
      'country': instance.country,
      'town': instance.town,
      'phoneNumber': instance.phoneNumber,
    };
