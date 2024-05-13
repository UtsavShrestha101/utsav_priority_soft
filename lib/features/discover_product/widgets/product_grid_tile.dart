import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/models/product.dart';
import 'package:myapp/core/router/app_router.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/core/ui/widget/network_assets.dart';
import 'package:myapp/features/discover_product/cubit/discover_product_cubit.dart';
import 'package:myapp/resources/assets.gen.dart';

class ProductGridTile extends StatelessWidget {
  final Product product;
  ProductGridTile({super.key, required this.product});
  final size = 24.sp;

  Widget categoryLogo(
    CategoryType type,
  ) {
    switch (type) {
      case CategoryType.NIKE:
        return Assets.icons.nike.svg(
          height: size,
          width: size,
          fit: BoxFit.cover,
        );
      case CategoryType.JORDAN:
        return Assets.icons.jordan.svg(
          height: size,
          fit: BoxFit.cover,
          width: size,
        );
      case CategoryType.ADIDAS:
        return Assets.icons.adidas.svg(
          height: size,
          fit: BoxFit.cover,
          width: size,
        );
      case CategoryType.REEBOK:
        return Assets.icons.reebok.svg(
          height: size,
          fit: BoxFit.cover,
          width: size,
        );
      case CategoryType.PUMA:
        return Assets.icons.puma.svg(
          height: size,
          fit: BoxFit.cover,
          width: size,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(ProductDetailRoute(
          product: product,
          bloc: context.read<DiscoverProductCubit>(),
        ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.sp),
            height: 150.sp,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryNeutral100,
              borderRadius: BorderRadius.circular(
                20.sp,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                categoryLogo(product.category),
                10.verticalSpace,
                Center(
                    child: NetworkAssets(
                  url: product.itemAssets[0],
                  imgHeight: 85.sp,
                  imgWidth: 150.sp,
                )),
              ],
            ),
          ),
          10.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                // "Jordan 1 Retro High Tie Dye",
                product.productName,
                style: context.bodyText200,
              ),
              5.verticalSpace,
              Row(
                children: [
                  Assets.icons.star.svg(
                    height: 15.sp,
                    width: 15.sp,
                  ),
                  5.horizontalSpace,
                  Text(
                    product.averageRating.toString(),
                    style: context.bodyTextBold10,
                  ),
                  5.horizontalSpace,
                  Text(
                    "(${product.noOfReview} Reviews)",
                    style: context.bodyText100.copyWith(
                      color: AppColors.primaryNeutral300,
                    ),
                  ),
                ],
              ),
              7.5.verticalSpace,
              Text(
                "\$${product.productPrice}",
                style: context.headline300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
