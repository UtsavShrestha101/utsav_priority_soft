import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/models/review.dart';
import 'package:myapp/features/product_detail/widgets/product_review_tile.dart';
import 'package:myapp/features/review/cubit/reviews_cubit.dart';

class ReviewContent extends StatelessWidget {
  const ReviewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, AsyncValue<ReviewsState>>(
      builder: (context, state) {
        return Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              final metrics = notification.metrics;

              if (metrics.extentAfter <= metrics.maxScrollExtent * 0.9) {
                context.read<ReviewsCubit>().fetchMoreReviewList();
              }

              return false;
            },
            child: ListView.builder(
              itemCount: state.data!.reviewList.length,
              itemBuilder: (context, index) {
                Review review = state.data!.reviewList[index];
                return ProductReviewTile(review: review);
              },
            ),
          ),
        );
        // Text(state.data!.reviewList.length.toString());
      },
    );
  }
}
