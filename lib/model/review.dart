import 'package:iteach/model/student.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  final String uid;
  final Student author;
  final String description;
  final double rating;
  final DateTime createdAt;
  final ReviewStatus status;

  Review({
    required this.uid,
    required this.author,
    required this.description,
    required this.rating,
    required this.createdAt,
    required this.status,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

@JsonEnum()
enum ReviewStatus {
  pending,
  approved,
  rejected,
}
