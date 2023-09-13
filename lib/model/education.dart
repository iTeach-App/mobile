import 'package:json_annotation/json_annotation.dart';

part 'education.g.dart';

@JsonEnum()
enum EducationLevel {
  primary,
  secondary,
  highSchool,
  college,
  university,
  master,
  doctorate,
  other
}

@JsonSerializable()
class Education {
  final EducationLevel level;
  final String description;

  Education({
    required this.level,
    required this.description,
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);
}
