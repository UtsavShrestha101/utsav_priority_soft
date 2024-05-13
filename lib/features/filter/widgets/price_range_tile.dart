import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/features/discover_product/cubit/discover_product_cubit.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceRangeTile extends StatelessWidget {
  const PriceRangeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverProductCubit, AsyncValue<DiscoverProductState>>(
        builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.sp),
              child: Text(
                "Price Range",
                style: context.headline400,
              ),
            ),
            20.verticalSpace,
            SfRangeSlider(
              overlayShape: const SfOverlayShape(),
              min: 0.0,
              max: 450.0,
              values: state.data!.rangeChoice,
              interval: 75,
              showLabels: true,
              activeColor: AppColors.primaryNeutral500,
              inactiveColor: AppColors.primaryNeutral100,
              onChanged: (SfRangeValues newValues) {
                context.read<DiscoverProductCubit>().choosePriceRange(newValues);
              },
            ),
          ],
        );
      },
    );
  }
}
