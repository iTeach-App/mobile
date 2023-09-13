import 'package:iteach/model/base_user.dart';
import 'package:iteach/model/location.dart';
import 'package:iteach/model/subject.dart';
import 'package:json_annotation/json_annotation.dart';

import 'education.dart';

part 'tutor.g.dart';

@JsonSerializable()
class Tutor extends BaseUser {
  final String? description;
  final DateTime birthDate;
  final Location classesLocation;
  final List<Subject> subjects;
  final List<Education> qualifications;
  final double hourlyRate;
  final double rating;

  Tutor({
    required String uid,
    required String fullName,
    required String email,
    required String avatarUrl,
    required String phoneNumber,
    required this.description,
    required this.birthDate,
    required this.classesLocation,
    required this.subjects,
    required this.qualifications,
    required this.hourlyRate,
    required this.rating,
  }) : super(
          uid: uid,
          fullName: fullName,
          email: email,
          avatarUrl: avatarUrl,
          phoneNumber: phoneNumber,
        );

  factory Tutor.fromJson(Map<String, dynamic> json) => _$TutorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TutorToJson(this);
}
