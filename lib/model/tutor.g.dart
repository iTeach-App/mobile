// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tutor _$TutorFromJson(Map<String, dynamic> json) => Tutor(
      uid: json['uid'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String,
      phoneNumber: json['phoneNumber'] as String,
      description: json['description'] as String?,
      birthDate: DateTime.parse(json['birthDate'] as String),
      classesLocation:
          Location.fromJson(json['classesLocation'] as Map<String, dynamic>),
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => $enumDecode(_$SubjectEnumMap, e))
          .toList(),
      qualifications: (json['qualifications'] as List<dynamic>)
          .map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList(),
      hourlyRate: (json['hourlyRate'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$TutorToJson(Tutor instance) => <String, dynamic>{
      'uid': instance.uid,
      'fullName': instance.fullName,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
      'phoneNumber': instance.phoneNumber,
      'description': instance.description,
      'birthDate': instance.birthDate.toIso8601String(),
      'classesLocation': instance.classesLocation,
      'subjects': instance.subjects.map((e) => _$SubjectEnumMap[e]!).toList(),
      'qualifications': instance.qualifications,
      'hourlyRate': instance.hourlyRate,
      'rating': instance.rating,
    };

const _$SubjectEnumMap = {
  Subject.mathematics: 'mathematics',
  Subject.science: 'science',
  Subject.english: 'english',
  Subject.history: 'history',
  Subject.geography: 'geography',
  Subject.foreignLanguages: 'foreignLanguages',
  Subject.computerScience: 'computerScience',
  Subject.economics: 'economics',
  Subject.accounting: 'accounting',
  Subject.psychology: 'psychology',
  Subject.sociology: 'sociology',
  Subject.politicalScience: 'politicalScience',
  Subject.environmentalScience: 'environmentalScience',
  Subject.philosophy: 'philosophy',
  Subject.music: 'music',
  Subject.art: 'art',
  Subject.physicalEducation: 'physicalEducation',
  Subject.testPreparation: 'testPreparation',
  Subject.writing: 'writing',
  Subject.engineering: 'engineering',
  Subject.healthcare: 'healthcare',
  Subject.business: 'business',
  Subject.legalStudies: 'legalStudies',
  Subject.nutrition: 'nutrition',
  Subject.astronomy: 'astronomy',
  Subject.linguistics: 'linguistics',
  Subject.religiousStudies: 'religiousStudies',
  Subject.theater: 'theater',
  Subject.filmAndMedia: 'filmAndMedia',
  Subject.chemistry: 'chemistry',
  Subject.anthropology: 'anthropology',
  Subject.archaeology: 'archaeology',
  Subject.architecture: 'architecture',
  Subject.automotiveTechnology: 'automotiveTechnology',
  Subject.biotechnology: 'biotechnology',
  Subject.communications: 'communications',
  Subject.culinaryArts: 'culinaryArts',
  Subject.design: 'design',
  Subject.earlyChildhoodEducation: 'earlyChildhoodEducation',
  Subject.electricalEngineering: 'electricalEngineering',
  Subject.fashionDesign: 'fashionDesign',
  Subject.gameDevelopment: 'gameDevelopment',
  Subject.genderStudies: 'genderStudies',
  Subject.graphicDesign: 'graphicDesign',
  Subject.horticulture: 'horticulture',
  Subject.industrialEngineering: 'industrialEngineering',
  Subject.interiorDesign: 'interiorDesign',
  Subject.marineBiology: 'marineBiology',
  Subject.marketing: 'marketing',
  Subject.mechanicalEngineering: 'mechanicalEngineering',
  Subject.nursing: 'nursing',
  Subject.paleontology: 'paleontology',
  Subject.pharmacology: 'pharmacology',
  Subject.photography: 'photography',
  Subject.publicRelations: 'publicRelations',
  Subject.robotics: 'robotics',
  Subject.socialWork: 'socialWork',
  Subject.statistics: 'statistics',
  Subject.sustainability: 'sustainability',
  Subject.veterinaryMedicine: 'veterinaryMedicine',
  Subject.zoology: 'zoology',
};
