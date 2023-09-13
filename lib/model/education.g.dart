// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Education _$EducationFromJson(Map<String, dynamic> json) => Education(
      level: $enumDecode(_$EducationLevelEnumMap, json['level']),
      description: json['description'] as String,
    );

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
      'level': _$EducationLevelEnumMap[instance.level]!,
      'description': instance.description,
    };

const _$EducationLevelEnumMap = {
  EducationLevel.primary: 'primary',
  EducationLevel.secondary: 'secondary',
  EducationLevel.highSchool: 'highSchool',
  EducationLevel.college: 'college',
  EducationLevel.university: 'university',
  EducationLevel.master: 'master',
  EducationLevel.doctorate: 'doctorate',
  EducationLevel.other: 'other',
};
