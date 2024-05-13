import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/models/product.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/core/ui/widget/network_assets.dart';
import 'package:myapp/features/cart/cubit/cart_cubit.dart';

class CartTile extends StatelessWidget {
  final Product product;
  const CartTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20.sp,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                context.read<CartCubit>().deleteProduct(product.productId);
              },
              backgroundColor: AppColors.error500,
              foregroundColor: Colors.white,
              icon: Icons.delete_outlined,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.sp),
                bottomLeft: Radius.circular(20.sp),
              ),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 88.sp,
              width: 88.sp,
              padding: EdgeInsets.symmetric(
                horizontal: 10.sp,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryNeutral100,
                borderRadius: BorderRadius.circular(
                  20.sp,
                ),
              ),
              child: NetworkAssets(
                url: product.itemAssets[0],
                imgHeight: 50.sp,
                imgWidth: 50.sp,
              ),
            ),
            15.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    style: context.headline400,
                  ),
                  5.verticalSpace,
                  Text(
                    "${categoryType(product.category)} . ${product.color} . ${product.size}",
                    style: context.bodyText100.copyWith(
                      color: const Color(
                        0xff666666,
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      Text(
                        "\$${product.productPrice}",
                        style: context.headline300,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (product.quantity > 1) {
                                context.read<CartCubit>().updateQuantity(
                                    product.productId, product.quantity - 1);
                              }
                            },
                            child: Icon(Icons.remove_circle_outline_outlined,
                                size: 24.sp,
                                color: product.quantity > 1
                                    ? AppColors.primaryNeutral500
                                    : AppColors.primaryNeutral300),
                          ),
                          10.horizontalSpace,
                          Text(
                            product.quantity.toString(),
                            style: context.headline300,
                          ),
                          10.horizontalSpace,
                          GestureDetector(
                            onTap: () {
                              context.read<CartCubit>().updateQuantity(
                                  product.productId, product.quantity + 1);
                            },
                            child: Icon(
                              Icons.add_circle_outline_outlined,
                              size: 24.sp,
                              color: AppColors.primaryNeutral500,
                            ),
                          ),
                          5.horizontalSpace,
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
