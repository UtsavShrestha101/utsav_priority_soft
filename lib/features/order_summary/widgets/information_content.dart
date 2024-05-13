import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/features/order_summary/widgets/information_tile.dart';

class InformationContent extends StatelessWidget {
  const InformationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Information",
          style: context.headline500,
        ),
        20.verticalSpace,
        const InformationTile(
          title: "Payment Method",
          content: "Credit card",
        ),
        10.verticalSpace,
        const Divider(
          color: AppColors.primaryNeutral100,
        ),
        10.verticalSpace,
        const InformationTile(
          title: "Location",
          content: "Semarang, Indonesia",
        ),
      ],
    );
  }
}
