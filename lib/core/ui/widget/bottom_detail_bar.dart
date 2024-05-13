import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/core/ui/widget/primary_button.dart';

class BottomDetailBar extends StatelessWidget {
  final String buttonLabel;
  final String title;
  final VoidCallback onPress;
  final double totalPrice;
  final bool isLoading;
  const BottomDetailBar(
      {super.key,
      required this.buttonLabel,
      required this.title,
      required this.onPress,
      required this.totalPrice,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.bodyText100.copyWith(
                  color: AppColors.primaryNeutral300,
                ),
              ),
              7.5.verticalSpace,
              Text(
                "\$$totalPrice",
                style: context.headline600.copyWith(
                  color: AppColors.primaryNeutral500,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 50.sp,
          width: 160.sp,
          child: PrimaryButton(
            isLoading: isLoading,
            onPressed: onPress,
            text: buttonLabel,
            textColor: Colors.white,
            color: AppColors.primaryNeutral500,
          ),
        ),
      ],
    );
  }
}
