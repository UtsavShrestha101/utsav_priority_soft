// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

class TimestampConverter implements JsonConverter<Timestamp, dynamic> {
  const TimestampConverter();

  @override
  Timestamp fromJson(dynamic json) {
    return (json as Timestamp?) ?? Timestamp.now();
  }

  @override
  dynamic toJson(Timestamp object) => object;
}

@freezed
class Review with _$Review {
  const factory Review({
    @Default("") String avatar,
    @Default(0.0) double rating,
    @Default("") String userName,
    @Default("") String review,
    @TimestampConverter() required Timestamp createdAt,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) =>
      _$ReviewFromJson(json);
}


