import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/router/app_router.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/features/discover_product/cubit/discover_product_cubit.dart';
import 'package:badges/badges.dart' as badges;
import 'package:myapp/resources/assets.gen.dart';


// widget used to display no of item in badge
class CartIndicatorButton extends StatelessWidget {
  final DiscoverProductCubit bloc;
  const CartIndicatorButton({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const CartRoute());
      },
      child:
          BlocBuilder<DiscoverProductCubit, AsyncValue<DiscoverProductState>>(
        bloc: bloc,
        builder: (context, state) {
          return state.data!.cartLength != 0
              ? badges.Badge(
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: AppColors.information500,
                  ),
                  badgeContent: Padding(
                    padding: EdgeInsets.all(1.5.sp),
                    child: Text(
                      state.data!.cartLength <= 99
                          ? state.data!.cartLength.toString()
                          : "99+",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  position: badges.BadgePosition.topEnd(
                    top: -9.sp,
                    end: -6.sp,
                  ),
                  child: Assets.icons.bag.svg(
                    height: 24.sp,
                    width: 24.sp,
                  ),
                )
              : Assets.icons.bag.svg(
                  height: 24.sp,
                  width: 24.sp,
                );
        },
      ),
    );
  }
}
