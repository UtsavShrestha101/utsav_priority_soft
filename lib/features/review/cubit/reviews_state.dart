part of 'reviews_cubit.dart';

@freezed
class ReviewsState with _$ReviewsState {
  const ReviewsState._();

  const factory ReviewsState({
    @Default("All") String category,
    @Default(false) bool reachedEnd,
    @Default([]) List<Review> reviewList,
  }) = _ReviewsState;

  bool get isListEmpty => reviewList.isEmpty;
}
