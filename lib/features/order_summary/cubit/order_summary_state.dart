part of 'order_summary_cubit.dart';

@freezed
class OrderSummaryState with _$OrderSummaryState {
  const factory OrderSummaryState({
    @Default([]) List<Product> productList,
    @Default(0.0) double totalPrice,
  }) = _OrderSummaryState;
}
