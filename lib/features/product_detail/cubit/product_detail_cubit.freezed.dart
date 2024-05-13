// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductDetailState {
  Product get product => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get productSizeSelect => throw _privateConstructorUsedError;
  int get productColorSelect => throw _privateConstructorUsedError;
  List<Review> get latestReviewList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDetailStateCopyWith<ProductDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailStateCopyWith<$Res> {
  factory $ProductDetailStateCopyWith(
          ProductDetailState value, $Res Function(ProductDetailState) then) =
      _$ProductDetailStateCopyWithImpl<$Res, ProductDetailState>;
  @useResult
  $Res call(
      {Product product,
      int quantity,
      double productSizeSelect,
      int productColorSelect,
      List<Review> latestReviewList});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$ProductDetailStateCopyWithImpl<$Res, $Val extends ProductDetailState>
    implements $ProductDetailStateCopyWith<$Res> {
  _$ProductDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
    Object? productSizeSelect = null,
    Object? productColorSelect = null,
    Object? latestReviewList = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      productSizeSelect: null == productSizeSelect
          ? _value.productSizeSelect
          : productSizeSelect // ignore: cast_nullable_to_non_nullable
              as double,
      productColorSelect: null == productColorSelect
          ? _value.productColorSelect
          : productColorSelect // ignore: cast_nullable_to_non_nullable
              as int,
      latestReviewList: null == latestReviewList
          ? _value.latestReviewList
          : latestReviewList // ignore: cast_nullable_to_non_nullable
              as List<Review>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductDetailStateImplCopyWith<$Res>
    implements $ProductDetailStateCopyWith<$Res> {
  factory _$$ProductDetailStateImplCopyWith(_$ProductDetailStateImpl value,
          $Res Function(_$ProductDetailStateImpl) then) =
      __$$ProductDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Product product,
      int quantity,
      double productSizeSelect,
      int productColorSelect,
      List<Review> latestReviewList});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$ProductDetailStateImplCopyWithImpl<$Res>
    extends _$ProductDetailStateCopyWithImpl<$Res, _$ProductDetailStateImpl>
    implements _$$ProductDetailStateImplCopyWith<$Res> {
  __$$ProductDetailStateImplCopyWithImpl(_$ProductDetailStateImpl _value,
      $Res Function(_$ProductDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
    Object? productSizeSelect = null,
    Object? productColorSelect = null,
    Object? latestReviewList = null,
  }) {
    return _then(_$ProductDetailStateImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      productSizeSelect: null == productSizeSelect
          ? _value.productSizeSelect
          : productSizeSelect // ignore: cast_nullable_to_non_nullable
              as double,
      productColorSelect: null == productColorSelect
          ? _value.productColorSelect
          : productColorSelect // ignore: cast_nullable_to_non_nullable
              as int,
      latestReviewList: null == latestReviewList
          ? _value._latestReviewList
          : latestReviewList // ignore: cast_nullable_to_non_nullable
              as List<Review>,
    ));
  }
}

/// @nodoc

class _$ProductDetailStateImpl extends _ProductDetailState {
  const _$ProductDetailStateImpl(
      {required this.product,
      this.quantity = 1,
      this.productSizeSelect = 39,
      this.productColorSelect = 0,
      final List<Review> latestReviewList = const []})
      : _latestReviewList = latestReviewList,
        super._();

  @override
  final Product product;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final double productSizeSelect;
  @override
  @JsonKey()
  final int productColorSelect;
  final List<Review> _latestReviewList;
  @override
  @JsonKey()
  List<Review> get latestReviewList {
    if (_latestReviewList is EqualUnmodifiableListView)
      return _latestReviewList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_latestReviewList);
  }

  @override
  String toString() {
    return 'ProductDetailState(product: $product, quantity: $quantity, productSizeSelect: $productSizeSelect, productColorSelect: $productColorSelect, latestReviewList: $latestReviewList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailStateImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.productSizeSelect, productSizeSelect) ||
                other.productSizeSelect == productSizeSelect) &&
            (identical(other.productColorSelect, productColorSelect) ||
                other.productColorSelect == productColorSelect) &&
            const DeepCollectionEquality()
                .equals(other._latestReviewList, _latestReviewList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      product,
      quantity,
      productSizeSelect,
      productColorSelect,
      const DeepCollectionEquality().hash(_latestReviewList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailStateImplCopyWith<_$ProductDetailStateImpl> get copyWith =>
      __$$ProductDetailStateImplCopyWithImpl<_$ProductDetailStateImpl>(
          this, _$identity);
}

abstract class _ProductDetailState extends ProductDetailState {
  const factory _ProductDetailState(
      {required final Product product,
      final int quantity,
      final double productSizeSelect,
      final int productColorSelect,
      final List<Review> latestReviewList}) = _$ProductDetailStateImpl;
  const _ProductDetailState._() : super._();

  @override
  Product get product;
  @override
  int get quantity;
  @override
  double get productSizeSelect;
  @override
  int get productColorSelect;
  @override
  List<Review> get latestReviewList;
  @override
  @JsonKey(ignore: true)
  _$$ProductDetailStateImplCopyWith<_$ProductDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
