import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/features/review/cubit/reviews_cubit.dart';

class ReviewCategoryTile extends StatelessWidget {
  ReviewCategoryTile({super.key});
  final List<String> category = [
    "All",
    "5 Stars",
    "4 Stars",
    "3 Stars",
    "2 Stars",
    "1 Stars",
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, AsyncValue<ReviewsState>>(
      builder: (context, state) {
        return SizedBox(
          height: 30.sp,
          child: ListView.separated(
            separatorBuilder: (context, index) => 20.horizontalSpace,
            scrollDirection: Axis.horizontal,
            itemCount: category.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  context.read<ReviewsCubit>().changeCategory(
                        category[index],
                      );
                },
                child: Text(
                  category[index],
                  style: context.headline600.copyWith(
                    color: category[index] == state.data!.category
                        ? AppColors.primaryNeutral500
                        : AppColors.primaryNeutral300,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
