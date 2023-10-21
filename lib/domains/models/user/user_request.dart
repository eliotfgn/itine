import 'package:json_annotation/json_annotation.dart';

part 'user_request.g.dart';

@JsonSerializable()
class UserRequest {
  final String firstName;
  final String lastName;
  final String password;
  final String email;
  final String country;
  final String town;
  final int phoneNumber;

  UserRequest(
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.country,
    this.town,
    this.phoneNumber,
  );

  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}
