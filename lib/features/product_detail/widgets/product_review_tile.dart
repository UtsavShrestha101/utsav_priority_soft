import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/extensions/datetime_extension.dart';
import 'package:myapp/core/models/review.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/core/ui/widget/network_assets.dart';
import 'package:myapp/resources/assets.gen.dart';

class ProductReviewTile extends StatelessWidget {
  final Review review;
  const ProductReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NetworkAssets(
            url: review.avatar,
            imgHeight: 40.sp,
            imgWidth: 40.sp,
          ),
          15.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.userName,
                  style: context.headline300,
                ),
                5.verticalSpace,
                RatingBarIndicator(
                  rating: review.rating,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(
                      right: 5.sp,
                    ),
                    child: Assets.icons.star.svg(),
                  ),
                  itemCount: 5,
                  itemSize: 20.sp,
                ),
                10.horizontalSpace,
                Text(
                  review.review,
                  style: context.bodyText100,
                ),
              ],
            ),
          ),
          Text(
            review.createdAt.toDate().relativeTime(),
            style: context.bodyText100.copyWith(
              color: AppColors.primaryNeutral300,
            ),
          ),
        ],
      ),
    );
  }
}
