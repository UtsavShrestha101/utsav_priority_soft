part of 'discover_product_cubit.dart';

@freezed
class DiscoverProductState with _$DiscoverProductState {
  const DiscoverProductState._();

  const factory DiscoverProductState({
    @Default("All") String category,
    @Default(0) int cartLength,
    @Default(false) bool reachedEnd,
    @Default([]) List<Product> productList,
    @Default(-1) int brandChoice,
    @Default(-1) int sortByChoice,
    @Default(-1) int genderChoice,
    @Default(-1) int colorChoice,
    @Default(SfRangeValues(0, 450.0)) SfRangeValues rangeChoice,
    @Default(0) int filterApplied,
  }) = _DiscoverProductState;

  bool get isListEmpty => productList.isEmpty;
}
