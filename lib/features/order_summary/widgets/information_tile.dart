import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';

class InformationTile extends StatelessWidget {
  final String title;
  final String content;
  const InformationTile(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.headline300,
              ),
              7.5.verticalSpace,
              Text(
                content,
                style: context.bodyText200.copyWith(
                  color: const Color(0xff666666),
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 17.sp,
          color: AppColors.primaryNeutral300,
        ),
      ],
    );
  }
}
