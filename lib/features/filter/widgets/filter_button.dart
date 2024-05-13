import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/router/app_router.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/core/ui/widget/primary_button.dart';
import 'package:badges/badges.dart' as badges;
import 'package:myapp/features/discover_product/cubit/discover_product_cubit.dart';
import 'package:myapp/resources/assets.gen.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverProductCubit, AsyncValue<DiscoverProductState>>(
      builder: (context, state) {
        return SizedBox(
          height: 50.sp,
          width: 140.sp,
          child: PrimaryButton(
            text: "FILTER",
            textColor: Colors.white,
            color: AppColors.primaryNeutral500,
            widget: Row(
              children: [
                state.data!.filterApplied != 0
                    ? badges.Badge(
                        badgeStyle: const badges.BadgeStyle(
                          badgeColor: Colors.transparent,
                        ),
                        badgeContent: Padding(
                            padding: EdgeInsets.all(1.5.sp),
                            child: Container(
                              height: 10.sp,
                              width: 10.sp,
                              decoration: const BoxDecoration(
                                color: AppColors.error500,
                                shape: BoxShape.circle,
                              ),
                            )),
                        position: badges.BadgePosition.topEnd(
                          top: -9.sp,
                          end: -6.sp,
                        ),
                        child: Assets.icons.filter.svg(
                          height: 20.sp,
                          width: 20.sp,
                        ),
                      )
                    : Assets.icons.filter.svg(
                        height: 20.sp,
                        width: 20.sp,
                      ),
                16.horizontalSpace,
                Text(
                  "FILTER",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            onPressed: () {
              context.router.push(
                FilterRoute(
                  cubit: context.read<DiscoverProductCubit>(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
