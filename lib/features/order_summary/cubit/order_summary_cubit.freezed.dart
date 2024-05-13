// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_summary_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderSummaryState {
  List<Product> get productList => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderSummaryStateCopyWith<OrderSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSummaryStateCopyWith<$Res> {
  factory $OrderSummaryStateCopyWith(
          OrderSummaryState value, $Res Function(OrderSummaryState) then) =
      _$OrderSummaryStateCopyWithImpl<$Res, OrderSummaryState>;
  @useResult
  $Res call({List<Product> productList, double totalPrice});
}

/// @nodoc
class _$OrderSummaryStateCopyWithImpl<$Res, $Val extends OrderSummaryState>
    implements $OrderSummaryStateCopyWith<$Res> {
  _$OrderSummaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productList = null,
    Object? totalPrice = null,
  }) {
    return _then(_value.copyWith(
      productList: null == productList
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderSummaryStateImplCopyWith<$Res>
    implements $OrderSummaryStateCopyWith<$Res> {
  factory _$$OrderSummaryStateImplCopyWith(_$OrderSummaryStateImpl value,
          $Res Function(_$OrderSummaryStateImpl) then) =
      __$$OrderSummaryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Product> productList, double totalPrice});
}

/// @nodoc
class __$$OrderSummaryStateImplCopyWithImpl<$Res>
    extends _$OrderSummaryStateCopyWithImpl<$Res, _$OrderSummaryStateImpl>
    implements _$$OrderSummaryStateImplCopyWith<$Res> {
  __$$OrderSummaryStateImplCopyWithImpl(_$OrderSummaryStateImpl _value,
      $Res Function(_$OrderSummaryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productList = null,
    Object? totalPrice = null,
  }) {
    return _then(_$OrderSummaryStateImpl(
      productList: null == productList
          ? _value._productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$OrderSummaryStateImpl implements _OrderSummaryState {
  const _$OrderSummaryStateImpl(
      {final List<Product> productList = const [], this.totalPrice = 0.0})
      : _productList = productList;

  final List<Product> _productList;
  @override
  @JsonKey()
  List<Product> get productList {
    if (_productList is EqualUnmodifiableListView) return _productList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productList);
  }

  @override
  @JsonKey()
  final double totalPrice;

  @override
  String toString() {
    return 'OrderSummaryState(productList: $productList, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSummaryStateImpl &&
            const DeepCollectionEquality()
                .equals(other._productList, _productList) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_productList), totalPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSummaryStateImplCopyWith<_$OrderSummaryStateImpl> get copyWith =>
      __$$OrderSummaryStateImplCopyWithImpl<_$OrderSummaryStateImpl>(
          this, _$identity);
}

abstract class _OrderSummaryState implements OrderSummaryState {
  const factory _OrderSummaryState(
      {final List<Product> productList,
      final double totalPrice}) = _$OrderSummaryStateImpl;

  @override
  List<Product> get productList;
  @override
  double get totalPrice;
  @override
  @JsonKey(ignore: true)
  _$$OrderSummaryStateImplCopyWith<_$OrderSummaryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
