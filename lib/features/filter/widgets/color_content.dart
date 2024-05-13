import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/features/discover_product/cubit/discover_product_cubit.dart';
import 'package:myapp/features/filter/widgets/color_tile.dart';

class ColorSelectContent extends StatelessWidget {
  ColorSelectContent({super.key});

  final List<String> sortByList = [
    "Man",
    "Women",
    "Unisex",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverProductCubit, AsyncValue<DiscoverProductState>>(
        builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 30.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Color",
                style: context.headline400,
              ),
              20.verticalSpace,
              SizedBox(
                height: 40.sp,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ColorTile(
                      title: "Black",
                      color: AppColors.primaryNeutral500,
                      onPress: () {
                        context.read<DiscoverProductCubit>().chooseColor(0);
                      },
                      isSelected: state.data!.colorChoice == 0,
                    ),
                    ColorTile(
                      title: "White",
                      color: Colors.white,
                      onPress: () {
                        context.read<DiscoverProductCubit>().chooseColor(1);
                      },
                      isSelected: state.data!.colorChoice == 1,
                    ),
                    ColorTile(
                      title: "Red",
                      color: AppColors.error500,
                      onPress: () {
                        context.read<DiscoverProductCubit>().chooseColor(2);
                      },
                      isSelected: state.data!.colorChoice == 2,
                      margin: 0,
                    ),
                  ],
                ),
              )
              // SizedBox(
              //   height: 45.sp,
              //   child: ListView.separated(
              //     separatorBuilder: (context, index) => 10.horizontalSpace,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: sortByList.length,
              //     itemBuilder: (_, index) {
              //       String sortBy = sortByList[index];
              //       return SizedBox(
              //         height: 40.sp,
              //         child: PrimaryButton(
              //             text: sortBy,
              //             onPressed: () {
              //               setState(() {
              //                 selectedGenderIndex = index;
              //               });
              //             },
              //             textColor: selectedGenderIndex == index
              //                 ? Colors.white
              //                 : AppColors.primaryNeutral500,
              //             color: selectedGenderIndex == index
              //                 ? AppColors.primaryNeutral500
              //                 : null),
              //       ); // return GestureDetector(
              //     },
              //   ),
              // )
            ],
          ),
        );
      },
    );
  }
}
