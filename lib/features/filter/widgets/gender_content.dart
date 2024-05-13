import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/core/ui/widget/primary_button.dart';
import 'package:myapp/features/discover_product/cubit/discover_product_cubit.dart';

class GenderSelectContent extends StatelessWidget {
  GenderSelectContent({super.key});

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
              "Gender",
              style: context.headline400,
            ),
            20.verticalSpace,
            SizedBox(
              height: 45.sp,
              child: ListView.separated(
                separatorBuilder: (context, index) => 10.horizontalSpace,
                scrollDirection: Axis.horizontal,
                itemCount: sortByList.length,
                itemBuilder: (_, index) {
                  String sortBy = sortByList[index];
                  return SizedBox(
                    height: 40.sp,
                    child: PrimaryButton(
                        text: sortBy,
                        onPressed: () {
                          context.read<DiscoverProductCubit>().chooseGender(index);
                        },
                        textColor: state.data!.genderChoice == index
                            ? Colors.white
                            : AppColors.primaryNeutral500,
                        color: state.data!.genderChoice == index
                            ? AppColors.primaryNeutral500
                            : null),
                  ); // return GestureDetector(
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
