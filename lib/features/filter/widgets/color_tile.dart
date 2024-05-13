import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';

class ColorTile extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  final double? margin;
  final bool isSelected;
  const ColorTile({
    super.key,
    required this.title,
    required this.color,
    required this.onPress,
    required this.isSelected,
    this.margin = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(right: margin!.sp),
        height: 40.sp,
        width: 100.sp,
        padding: EdgeInsets.symmetric(
          horizontal: 10.sp,
          vertical: 7.sp,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? AppColors.primaryNeutral500
                : AppColors.primaryNeutral200,
          ),
          borderRadius: BorderRadius.circular(
            20.sp,
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 20.sp,
              width: 20.sp,
              decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primaryNeutral200,
                  )),
            ),
            10.horizontalSpace,
            Text(
              title,
              style: context.headline400,
            )
          ],
        ),
      ),
    );
  }
}
