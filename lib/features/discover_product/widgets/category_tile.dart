import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/features/discover_product/cubit/discover_product_cubit.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({super.key});
  final List<String> category = [
    "All",
    "Nike",
    "Jordan",
    "Adidas",
    "Reebok",
    "Puma",
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverProductCubit, AsyncValue<DiscoverProductState>>(
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
                  context.read<DiscoverProductCubit>().changeCategory(
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
