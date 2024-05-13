// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 1;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      productId: fields[0] as String,
      averageRating: fields[1] as double,
      category: fields[2] as CategoryType,
      description: fields[3] as String,
      noOfReview: fields[4] as int,
      productName: fields[5] as String,
      productPrice: fields[6] as int,
      itemAssets: (fields[7] as List).cast<String>(),
      size: fields[8] as double,
      quantity: fields[9] as int,
      color: fields[10] as String,
      gender: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.averageRating)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.noOfReview)
      ..writeByte(5)
      ..write(obj.productName)
      ..writeByte(6)
      ..write(obj.productPrice)
      ..writeByte(7)
      ..write(obj.itemAssets)
      ..writeByte(8)
      ..write(obj.size)
      ..writeByte(9)
      ..write(obj.quantity)
      ..writeByte(10)
      ..write(obj.color)
      ..writeByte(11)
      ..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryTypeAdapter extends TypeAdapter<CategoryType> {
  @override
  final int typeId = 2;

  @override
  CategoryType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CategoryType.NIKE;
      case 1:
        return CategoryType.JORDAN;
      case 2:
        return CategoryType.ADIDAS;
      case 3:
        return CategoryType.REEBOK;
      case 4:
        return CategoryType.PUMA;
      default:
        return CategoryType.NIKE;
    }
  }

  @override
  void write(BinaryWriter writer, CategoryType obj) {
    switch (obj) {
      case CategoryType.NIKE:
        writer.writeByte(0);
        break;
      case CategoryType.JORDAN:
        writer.writeByte(1);
        break;
      case CategoryType.ADIDAS:
        writer.writeByte(2);
        break;
      case CategoryType.REEBOK:
        writer.writeByte(3);
        break;
      case CategoryType.PUMA:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      productId: json['productId'] as String? ?? "",
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      category: $enumDecodeNullable(_$CategoryTypeEnumMap, json['category']) ??
          CategoryType.NIKE,
      description: json['description'] as String? ?? "",
      noOfReview: (json['noOfReview'] as num?)?.toInt() ?? 0,
      productName: json['productName'] as String? ?? "",
      productPrice: (json['productPrice'] as num?)?.toInt() ?? 0,
      itemAssets: (json['itemAssets'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      size: (json['size'] as num?)?.toDouble() ?? 0.0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      color: json['color'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'averageRating': instance.averageRating,
      'category': _$CategoryTypeEnumMap[instance.category]!,
      'description': instance.description,
      'noOfReview': instance.noOfReview,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'itemAssets': instance.itemAssets,
      'size': instance.size,
      'quantity': instance.quantity,
      'color': instance.color,
      'gender': instance.gender,
      'createdAt': _$JsonConverterToJson<dynamic, Timestamp>(
          instance.createdAt, const TimestampConverter().toJson),
    };

const _$CategoryTypeEnumMap = {
  CategoryType.NIKE: 'Nike',
  CategoryType.JORDAN: 'Jordan',
  CategoryType.ADIDAS: 'Adidas',
  CategoryType.REEBOK: 'Reebok',
  CategoryType.PUMA: 'Puma',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
