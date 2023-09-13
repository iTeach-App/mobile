import 'package:iteach/model/base_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student extends BaseUser {
  Student(
      {required super.uid,
      required super.fullName,
      required super.email,
      required super.avatarUrl,
      required super.phoneNumber});

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
