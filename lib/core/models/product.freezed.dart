// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @HiveField(0)
  String get productId => throw _privateConstructorUsedError;
  @HiveField(1)
  double get averageRating => throw _privateConstructorUsedError;
  @HiveField(2)
  CategoryType get category => throw _privateConstructorUsedError;
  @HiveField(3)
  String get description => throw _privateConstructorUsedError;
  @HiveField(4)
  int get noOfReview => throw _privateConstructorUsedError;
  @HiveField(5)
  String get productName => throw _privateConstructorUsedError;
  @HiveField(6)
  int get productPrice => throw _privateConstructorUsedError;
  @HiveField(7)
  List<String> get itemAssets => throw _privateConstructorUsedError;
  @HiveField(8)
  double get size => throw _privateConstructorUsedError;
  @HiveField(9)
  int get quantity => throw _privateConstructorUsedError;
  @HiveField(10)
  String get color => throw _privateConstructorUsedError;
  @HiveField(11)
  String get gender => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@HiveField(0) String productId,
      @HiveField(1) double averageRating,
      @HiveField(2) CategoryType category,
      @HiveField(3) String description,
      @HiveField(4) int noOfReview,
      @HiveField(5) String productName,
      @HiveField(6) int productPrice,
      @HiveField(7) List<String> itemAssets,
      @HiveField(8) double size,
      @HiveField(9) int quantity,
      @HiveField(10) String color,
      @HiveField(11) String gender,
      @TimestampConverter() Timestamp? createdAt});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? averageRating = null,
    Object? category = null,
    Object? description = null,
    Object? noOfReview = null,
    Object? productName = null,
    Object? productPrice = null,
    Object? itemAssets = null,
    Object? size = null,
    Object? quantity = null,
    Object? color = null,
    Object? gender = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      noOfReview: null == noOfReview
          ? _value.noOfReview
          : noOfReview // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      itemAssets: null == itemAssets
          ? _value.itemAssets
          : itemAssets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String productId,
      @HiveField(1) double averageRating,
      @HiveField(2) CategoryType category,
      @HiveField(3) String description,
      @HiveField(4) int noOfReview,
      @HiveField(5) String productName,
      @HiveField(6) int productPrice,
      @HiveField(7) List<String> itemAssets,
      @HiveField(8) double size,
      @HiveField(9) int quantity,
      @HiveField(10) String color,
      @HiveField(11) String gender,
      @TimestampConverter() Timestamp? createdAt});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? averageRating = null,
    Object? category = null,
    Object? description = null,
    Object? noOfReview = null,
    Object? productName = null,
    Object? productPrice = null,
    Object? itemAssets = null,
    Object? size = null,
    Object? quantity = null,
    Object? color = null,
    Object? gender = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ProductImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      noOfReview: null == noOfReview
          ? _value.noOfReview
          : noOfReview // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      itemAssets: null == itemAssets
          ? _value._itemAssets
          : itemAssets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {@HiveField(0) this.productId = "",
      @HiveField(1) this.averageRating = 0.0,
      @HiveField(2) this.category = CategoryType.NIKE,
      @HiveField(3) this.description = "",
      @HiveField(4) this.noOfReview = 0,
      @HiveField(5) this.productName = "",
      @HiveField(6) this.productPrice = 0,
      @HiveField(7) final List<String> itemAssets = const [],
      @HiveField(8) this.size = 0.0,
      @HiveField(9) this.quantity = 0,
      @HiveField(10) this.color = "",
      @HiveField(11) this.gender = "",
      @TimestampConverter() this.createdAt})
      : _itemAssets = itemAssets;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final String productId;
  @override
  @JsonKey()
  @HiveField(1)
  final double averageRating;
  @override
  @JsonKey()
  @HiveField(2)
  final CategoryType category;
  @override
  @JsonKey()
  @HiveField(3)
  final String description;
  @override
  @JsonKey()
  @HiveField(4)
  final int noOfReview;
  @override
  @JsonKey()
  @HiveField(5)
  final String productName;
  @override
  @JsonKey()
  @HiveField(6)
  final int productPrice;
  final List<String> _itemAssets;
  @override
  @JsonKey()
  @HiveField(7)
  List<String> get itemAssets {
    if (_itemAssets is EqualUnmodifiableListView) return _itemAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemAssets);
  }

  @override
  @JsonKey()
  @HiveField(8)
  final double size;
  @override
  @JsonKey()
  @HiveField(9)
  final int quantity;
  @override
  @JsonKey()
  @HiveField(10)
  final String color;
  @override
  @JsonKey()
  @HiveField(11)
  final String gender;
  @override
  @TimestampConverter()
  final Timestamp? createdAt;

  @override
  String toString() {
    return 'Product(productId: $productId, averageRating: $averageRating, category: $category, description: $description, noOfReview: $noOfReview, productName: $productName, productPrice: $productPrice, itemAssets: $itemAssets, size: $size, quantity: $quantity, color: $color, gender: $gender, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.noOfReview, noOfReview) ||
                other.noOfReview == noOfReview) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            const DeepCollectionEquality()
                .equals(other._itemAssets, _itemAssets) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productId,
      averageRating,
      category,
      description,
      noOfReview,
      productName,
      productPrice,
      const DeepCollectionEquality().hash(_itemAssets),
      size,
      quantity,
      color,
      gender,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {@HiveField(0) final String productId,
      @HiveField(1) final double averageRating,
      @HiveField(2) final CategoryType category,
      @HiveField(3) final String description,
      @HiveField(4) final int noOfReview,
      @HiveField(5) final String productName,
      @HiveField(6) final int productPrice,
      @HiveField(7) final List<String> itemAssets,
      @HiveField(8) final double size,
      @HiveField(9) final int quantity,
      @HiveField(10) final String color,
      @HiveField(11) final String gender,
      @TimestampConverter() final Timestamp? createdAt}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @HiveField(0)
  String get productId;
  @override
  @HiveField(1)
  double get averageRating;
  @override
  @HiveField(2)
  CategoryType get category;
  @override
  @HiveField(3)
  String get description;
  @override
  @HiveField(4)
  int get noOfReview;
  @override
  @HiveField(5)
  String get productName;
  @override
  @HiveField(6)
  int get productPrice;
  @override
  @HiveField(7)
  List<String> get itemAssets;
  @override
  @HiveField(8)
  double get size;
  @override
  @HiveField(9)
  int get quantity;
  @override
  @HiveField(10)
  String get color;
  @override
  @HiveField(11)
  String get gender;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
