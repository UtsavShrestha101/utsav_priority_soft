// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/models/product.dart';
import 'package:myapp/features/discover_product/cubit/discover_product_cubit.dart';
import 'package:myapp/features/filter/widgets/brand_tile.dart';

class BrandContent extends StatelessWidget {
  BrandContent({super.key});

  final List<CategoryType> categoryTypeList = [
    CategoryType.NIKE,
    CategoryType.JORDAN,
    CategoryType.ADIDAS,
    CategoryType.REEBOK,
    CategoryType.PUMA,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverProductCubit, AsyncValue<DiscoverProductState>>(
        builder: (context, state) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Brands",
              style: context.headline400,
            ),
            20.verticalSpace,
            SizedBox(
              height: 100.sp,
              child: ListView.separated(
                separatorBuilder: (context, index) => 22.5.horizontalSpace,
                scrollDirection: Axis.horizontal,
                itemCount: categoryTypeList.length,
                itemBuilder: (_, index) {
                  CategoryType categoryName = categoryTypeList[index];
                  return BrandTile(
                    categoryName: categoryName,
                    isSelected: state.data!.brandChoice == index,
                    onPress: () {
                      context.read<DiscoverProductCubit>().chooseBrand(index);
                    },
                  ); // return GestureDetector(
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
