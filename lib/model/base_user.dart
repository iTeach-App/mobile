import 'package:json_annotation/json_annotation.dart';

part 'base_user.g.dart';

@JsonSerializable()
class BaseUser {
  final String uid;
  final String fullName;
  final String email;
  final String avatarUrl;
  final String phoneNumber;

  BaseUser({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.avatarUrl,
    required this.phoneNumber,
  });

  factory BaseUser.fromJson(Map<String, dynamic> json) =>
      _$BaseUserFromJson(json);

  Map<String, dynamic> toJson() => _$BaseUserToJson(this);
}
