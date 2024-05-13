// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/models/product.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/resources/assets.gen.dart';

class BrandTile extends StatelessWidget {
  final CategoryType categoryName;
  final bool isSelected;
  final VoidCallback onPress;
  BrandTile(
      {super.key,
      required this.categoryName,
      required this.isSelected,
      required this.onPress});

  final size = 24.sp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 13.sp, vertical: 16.5.sp),
                height: 50.sp,
                width: 50.sp,
                decoration: const BoxDecoration(
                  color: AppColors.primaryNeutral100,
                  shape: BoxShape.circle,
                ),
                child: categoryLogo(categoryName),
              ),
              isSelected
                  ? Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 20.sp,
                        width: 20.sp,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryNeutral500,
                        ),
                        child: Icon(
                          Icons.check,
                          size: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
          15.verticalSpace,
          Text(
            categoryType(categoryName),
            style: context.headline300,
          ),
          7.5.verticalSpace,
          Text(
            "100 Items",
            style: context.bodyText10.copyWith(
              color: AppColors.primaryNeutral300,
            ),
          )
        ],
      ),
    );
  }

  Widget categoryLogo(
    CategoryType type,
  ) {
    switch (type) {
      case CategoryType.NIKE:
        return Assets.icons.nike.svg(
          height: size,
          width: size,
          fit: BoxFit.cover,
          color: AppColors.primaryNeutral500,
        );
      case CategoryType.JORDAN:
        return Assets.icons.jordan.svg(
          height: size,
          fit: BoxFit.cover,
          width: size,
          color: AppColors.primaryNeutral500,
        );
      case CategoryType.ADIDAS:
        return Assets.icons.adidas.svg(
          height: size,
          fit: BoxFit.cover,
          width: size,
          color: AppColors.primaryNeutral500,
        );
      case CategoryType.REEBOK:
        return Assets.icons.reebok.svg(
          height: size,
          fit: BoxFit.cover,
          width: size,
          color: AppColors.primaryNeutral500,
        );
      case CategoryType.PUMA:
        return Assets.icons.puma.svg(
          height: size,
          fit: BoxFit.cover,
          width: size,
          color: AppColors.primaryNeutral500,
        );
    }
  }
}
