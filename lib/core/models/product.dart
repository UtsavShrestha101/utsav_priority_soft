// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'product.freezed.dart';
part 'product.g.dart';

class TimestampConverter implements JsonConverter<Timestamp, dynamic> {
  const TimestampConverter();

  @override
  Timestamp fromJson(dynamic json) {
    return (json as Timestamp?) ?? Timestamp.now();
  }

  @override
  dynamic toJson(Timestamp object) => object;
}

@HiveType(typeId: 1)
@freezed
class Product with _$Product {
  const factory Product({
    @HiveField(0) @Default("") String productId,
    @HiveField(1) @Default(0.0) double averageRating,
    @HiveField(2) @Default(CategoryType.NIKE) CategoryType category,
    @HiveField(3) @Default("") String description,
    @HiveField(4) @Default(0) int noOfReview,
    @HiveField(5) @Default("") String productName,
    @HiveField(6) @Default(0) int productPrice,
    @HiveField(7) @Default([]) List<String> itemAssets,
    @HiveField(8) @Default(0.0) double size,
    @HiveField(9) @Default(0) int quantity,
    @HiveField(10) @Default("") String color,
    @HiveField(11) @Default("") String gender,
    @TimestampConverter() Timestamp? createdAt,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@HiveType(typeId: 2)
enum CategoryType {
  @HiveField(0)
  @JsonValue("Nike")
  NIKE,
  @HiveField(1)
  @JsonValue("Jordan")
  JORDAN,

  @HiveField(2)
  @JsonValue("Adidas")
  ADIDAS,
  @HiveField(3)
  @JsonValue("Reebok")
  REEBOK,
  @HiveField(4)
  @JsonValue("Puma")
  PUMA,
}

//to convert enum to string

String categoryType(
  CategoryType type,
) {
  switch (type) {
    case CategoryType.NIKE:
      return "Nike";
    case CategoryType.JORDAN:
      return "Jordan";
    case CategoryType.ADIDAS:
      return "Adidas";
    case CategoryType.REEBOK:
      return "Reebok";
    case CategoryType.PUMA:
      return "Puma";
  }
}
