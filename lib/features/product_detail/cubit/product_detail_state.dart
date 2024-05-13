part of 'product_detail_cubit.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const ProductDetailState._();

  const factory ProductDetailState({
    required Product product,
    @Default(1) int quantity,
    @Default(39) double productSizeSelect,
    @Default(0) int productColorSelect,
    @Default([]) List<Review> latestReviewList,
  }) = _ProductDetailState;

  bool get isListEmpty => latestReviewList.isEmpty;
}
