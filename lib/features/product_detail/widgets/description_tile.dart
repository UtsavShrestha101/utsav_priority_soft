import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';

class DescriptionTile extends StatelessWidget {
  final String description;
  const DescriptionTile({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: context.headline400,
        ),
        10.verticalSpace,
        Text(
          description,
          style: context.bodyText200.copyWith(
            color: AppColors.primaryNeutral400,
          ),
        ),
      ],
    );
  }
}
