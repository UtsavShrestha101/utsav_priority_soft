import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/core/ui/widget/network_assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myapp/features/product_detail/cubit/product_detail_cubit.dart';

class ProductImageTile extends StatefulWidget {
  final List<String> productAssets;
  const ProductImageTile({super.key, required this.productAssets});

  @override
  State<ProductImageTile> createState() => _ProductImageTileState();
}

class _ProductImageTileState extends State<ProductImageTile> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      height: 315.sp,
      width: 315.sp,
      decoration: BoxDecoration(
        color: AppColors.primaryNeutral100,
        borderRadius: BorderRadius.circular(
          20.sp,
        ),
      ),
      child: Column(
        children: [
          30.verticalSpace,
          CarouselSlider(
            items: widget.productAssets
                .map(
                  (imagePath) => NetworkAssets(
                    url: widget.productAssets[currentIndex],
                    imgHeight: 200.sp,
                    imgWidth: 200.sp,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 200.sp,
              viewportFraction: 1,
              aspectRatio: (16 / 9).sp,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          25.verticalSpace,
          Row(
            children: [
              Row(
                children: List.generate(
                  widget.productAssets.length,
                  (index) => Container(
                    margin: EdgeInsets.only(
                      right: 5.sp,
                    ),
                    height: 10.sp,
                    width: 10.sp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == currentIndex
                          ? AppColors.primaryNeutral500
                          : AppColors.primaryNeutral300,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(10.sp),
                width: 130.sp,
                height: 40.sp,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.sp),
                ),
                child: const Row(
                  children: [
                    ColorSelectorTile(
                      index: 0,
                      color: Colors.white,
                      borderColor: AppColors.primaryNeutral200,
                    ),
                    ColorSelectorTile(
                      index: 1,
                      color: AppColors.primaryNeutral500,
                    ),
                    ColorSelectorTile(
                      index: 2,
                      color: Color(0xff648B8B),
                    ),
                    ColorSelectorTile(
                      index: 3,
                      color: AppColors.information500,
                      margin: 0,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ColorSelectorTile extends StatelessWidget {
  final int index;
  final Color color;
  final double? margin;
  final Color? borderColor;
  const ColorSelectorTile(
      {super.key,
      required this.color,
      this.margin = 10,
      this.borderColor,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ProductDetailCubit>().selectProductColor(index);
      },
      child: BlocBuilder<ProductDetailCubit, AsyncValue<ProductDetailState>>(
        builder: (context, state) {
          return Container(
            height: 20.sp,
            width: 20.sp,
            margin: EdgeInsets.only(right: margin!.sp),
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor ?? color,
              ),
              color: color,
              shape: BoxShape.circle,
            ),
            child: index == state.data!.productColorSelect
                ? Icon(
                    Icons.check,
                    color:
                        index == 0 ? AppColors.primaryNeutral500 : Colors.white,
                    size: 15.sp,
                  )
                : null,
          );
        },
      ),
    );
  }
}
