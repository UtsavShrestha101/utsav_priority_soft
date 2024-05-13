import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/models/review.dart';
import 'package:myapp/core/repository/review_repository.dart';

part 'reviews_state.dart';
part 'reviews_cubit.freezed.dart';

@injectable
class ReviewsCubit extends BaseAsyncCubit<ReviewsState> {
  final ReviewRepository reviewRepository;
  ReviewsCubit(this.reviewRepository) {
    emit(
      const AsyncValue.initial(
        data: ReviewsState(),
      ),
    );
  }

  Future<void> getReviewList() async {
    emit(AsyncValue.loading(data: state.data!));
    await runguarded(() async {
      List<Review> reviewList = await reviewRepository.getLatestList(
        maxRating: getRatingRangeUpperBound(),
        minRating: getRatingRangeLowerBound(),
      );
      return state.data!.copyWith(
        reviewList: reviewList,
        reachedEnd: reviewList.length < 10,
      );
    });
  }

  Future<void> refreshContent() async {
    await changeCategory(state.data!.category);
  }

  Future<void> changeCategory(String category) async {
    emit(
      AsyncValue.initial(
        data: ReviewsState(
          category: category,
        ),
      ),
    );
    await getReviewList();
  }

  Future<void> fetchMoreReviewList() async {
    if (state.data!.reachedEnd || state.isLoading) {
      return;
    }
    emit(AsyncValue.loading(data: state.data!));

    await runguarded(() async {
      List<Review> reviewList = await reviewRepository.getLatestList(
        lastItem: state.data!.reviewList.last,
        maxRating: getRatingRangeUpperBound(),
        minRating: getRatingRangeLowerBound(),
      );
      return state.data!.copyWith(
        reviewList: [
          ...state.data!.reviewList,
          ...reviewList,
        ],
        reachedEnd: reviewList.length < 10,
      );
    });
  }

  double getRatingRangeLowerBound() {
    switch (state.data!.category) {
      case "All":
        return 0.0;
      case "1 Stars":
        return 0.0;
      case "2 Stars":
        return 1.0;
      case "3 Stars":
        return 2.0;
      case "4 Stars":
        return 3.0;
      case "5 Stars":
        return 4.0;
      default:
        return 0.0;
    }
  }

  double getRatingRangeUpperBound() {
    switch (state.data!.category) {
      case "All":
        return 5.0;
      case "1 Stars":
        return 0.9;
      case "2 Stars":
        return 1.9;
      case "3 Stars":
        return 2.9;
      case "4 Stars":
        return 3.9;
      case "5 Stars":
        return 5.0;
      default:
        return 0.0;
    }
  }
}
