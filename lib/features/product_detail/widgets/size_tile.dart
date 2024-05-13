import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/features/product_detail/cubit/product_detail_cubit.dart';

class ProductSizeTile extends StatelessWidget {
  ProductSizeTile({super.key});

  final List<double> productSize = [39, 39.5, 40, 40.5, 41];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, AsyncValue<ProductDetailState>>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Size",
              style: context.headline400,
            ),
            10.verticalSpace,
            Row(
              children: productSize
                  .map(
                    (size) => GestureDetector(
                      onTap: () {
                        context
                            .read<ProductDetailCubit>()
                            .selectProductSize(size);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          right: 15.sp,
                        ),
                        height: 40.sp,
                        width: 40.sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primaryNeutral200,
                          ),
                          color: size == state.data!.productSizeSelect
                              ? AppColors.primaryNeutral500
                              : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            size.toString(),
                            style: context.headline300.copyWith(
                              color: size == state.data!.productSizeSelect
                                  ? Colors.white
                                  : AppColors.primaryNeutral400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
