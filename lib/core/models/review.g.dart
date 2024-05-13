// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      avatar: json['avatar'] as String? ?? "",
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      userName: json['userName'] as String? ?? "",
      review: json['review'] as String? ?? "",
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'rating': instance.rating,
      'userName': instance.userName,
      'review': instance.review,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
