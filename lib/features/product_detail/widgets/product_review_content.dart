import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/models/review.dart';
import 'package:myapp/core/router/app_router.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/core/ui/widget/primary_button.dart';
import 'package:myapp/features/product_detail/cubit/product_detail_cubit.dart';
import 'package:myapp/features/product_detail/widgets/product_review_tile.dart';

class ProductReviewContent extends StatelessWidget {
  final int noOfReview;
  final double averageRating;
  const ProductReviewContent(
      {super.key, required this.noOfReview, required this.averageRating});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, AsyncValue<ProductDetailState>>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Review ($noOfReview)",
              style: context.headline400,
            ),
            10.verticalSpace,
            (state.isLoading && state.data!.isListEmpty)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.hasError
                    ? Text(state.errorMessage)
                    : state.data!.isListEmpty
                        ? const Text("Empty")
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.data!.latestReviewList.length,
                            itemBuilder: (context, index) {
                              Review review =
                                  state.data!.latestReviewList[index];
                              return ProductReviewTile(
                                review: review,
                              );
                            },
                          ),
            20.verticalSpace,
            noOfReview > 3
                ? SizedBox(
                    height: 50.sp,
                    width: double.infinity,
                    child: PrimaryButton(
                      onPressed: () {
                        context.router.push(
                          ReviewsRoute(
                            averageRating: averageRating,
                            noOfReviews: noOfReview,
                          ),
                        );
                      },
                      text: "SEE ALL REVIEW",
                      textColor: AppColors.primaryNeutral500,
                    ),
                  )
                : const SizedBox.shrink(),
            10.verticalSpace,
          ],
        );
      },
    );
  }
}
