import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/core/ui/widget/primary_button.dart';
import 'package:myapp/features/discover_product/cubit/discover_product_cubit.dart';

class FilterBottomTile extends StatelessWidget {
  const FilterBottomTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiscoverProductCubit, AsyncValue<DiscoverProductState>>(
      listener: (BuildContext context, AsyncValue<DiscoverProductState> state) {
        state.whenOrNull(
          data: (data) => context.pop(),
        );
      },
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(
            left: 30.sp,
            right: 30.sp,
            bottom: 10.sp,
          ),
          height: 50.sp,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50.sp,
                  width: double.infinity,
                  child: PrimaryButton(
                    onPressed: () {
                      context.read<DiscoverProductCubit>().resetAll();
                    },
                    text:
                        "RESET ${state.data!.filterApplied == 0 ? "" : "(${state.data!.filterApplied})"}",
                    textColor: AppColors.primaryNeutral500,
                  ),
                ),
              ),
              15.horizontalSpace,
              Expanded(
                child: SizedBox(
                  height: 50.sp,
                  width: double.infinity,
                  child: PrimaryButton(
                    onPressed: () {
                      context.read<DiscoverProductCubit>().filter();
                    },
                    text: "APPLY",
                    textColor: Colors.white,
                    color: AppColors.primaryNeutral500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
