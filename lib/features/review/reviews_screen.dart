import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/dependency_injection/di.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/widget/empty_alert_tile.dart';
import 'package:myapp/core/ui/widget/priority_soft_app_bar.dart';
import 'package:myapp/features/review/cubit/reviews_cubit.dart';
import 'package:myapp/features/review/widgets/review_category_tile.dart';
import 'package:myapp/features/review/widgets/review_content.dart';
import 'package:myapp/resources/assets.gen.dart';

@RoutePage()
class ReviewsScreen extends StatelessWidget {
  final double averageRating;
  final int noOfReviews;
  const ReviewsScreen(
      {super.key, required this.averageRating, required this.noOfReviews});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<ReviewsCubit>()..getReviewList(),
      child: Scaffold(
        appBar: PrioritySoftAppBar(
          centerTitle: true,
          text: "Review ($noOfReviews)",
          actions: [
            Row(
              children: [
                Assets.icons.star.svg(
                  height: 20.sp,
                  width: 20.sp,
                ),
                5.horizontalSpace,
                Text(
                  averageRating.toString(),
                  style: context.headline300,
                ),
                15.horizontalSpace,
              ],
            )
          ],
        ),
        body: BlocConsumer<ReviewsCubit, AsyncValue<ReviewsState>>(
          listener: (context, state) {
            state.whenOrNull(
              error: (data, message) => context.showErrorSnackBar(message),
            );
          },
          builder: (context, state) {
            return SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 25.sp,
                ),
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<ReviewsCubit>().refreshContent();
                  },
                  child: Column(
                    children: [
                      10.verticalSpace,
                      ReviewCategoryTile(),
                      (state.isLoading && state.data!.isListEmpty)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : state.hasError
                              ? Text(state.errorMessage)
                              : state.data!.isListEmpty
                                  ? const Expanded(
                                      child: EmptyAlertTile(
                                        msg: "Oops, No reviews available",
                                      ),
                                    )
                                  : const ReviewContent()
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
