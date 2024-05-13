part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    @Default(0.0) double totalPrice,
    @Default([]) List<Product> cartItems,
    @Default("") String msg,
  }) = _CartState;

  bool get isListEmpty => cartItems.isEmpty;
}
