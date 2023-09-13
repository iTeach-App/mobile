// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      uid: json['uid'] as String,
      author: Student.fromJson(json['author'] as Map<String, dynamic>),
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: $enumDecode(_$ReviewStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'uid': instance.uid,
      'author': instance.author,
      'description': instance.description,
      'rating': instance.rating,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': _$ReviewStatusEnumMap[instance.status]!,
    };

const _$ReviewStatusEnumMap = {
  ReviewStatus.pending: 'pending',
  ReviewStatus.approved: 'approved',
  ReviewStatus.rejected: 'rejected',
};
