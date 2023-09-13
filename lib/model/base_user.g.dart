// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseUser _$BaseUserFromJson(Map<String, dynamic> json) => BaseUser(
      uid: json['uid'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$BaseUserToJson(BaseUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'fullName': instance.fullName,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
      'phoneNumber': instance.phoneNumber,
    };
