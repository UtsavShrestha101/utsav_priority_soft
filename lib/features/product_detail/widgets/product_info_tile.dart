import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/resources/assets.gen.dart';

class ProductInfoTile extends StatelessWidget {
  final double averageRating;
  final int noOfReview;
  const ProductInfoTile(
      {super.key, required this.averageRating, required this.noOfReview});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: averageRating,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(
              right: 5.sp,
            ),
            child: Assets.icons.star.svg(),
          ),
          itemCount: 5,
          itemSize: 20.sp,
        ),
        5.horizontalSpace,
        Text(
          averageRating.toString(),
          style: context.bodyTextBold10,
        ),
        5.horizontalSpace,
        Text(
          "($noOfReview Reviews)",
          style: context.bodyText100.copyWith(
            color: AppColors.primaryNeutral300,
          ),
        ),
      ],
    );
  }
}
