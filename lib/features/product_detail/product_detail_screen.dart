import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/dependency_injection/di.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/models/product.dart';
import 'package:myapp/core/ui/widget/cart_indicator_button.dart';
import 'package:myapp/core/ui/widget/priority_soft_app_bar.dart';
import 'package:myapp/features/discover_product/cubit/discover_product_cubit.dart';
import 'package:myapp/features/product_detail/cubit/product_detail_cubit.dart';
import 'package:myapp/features/product_detail/widgets/add_to_cart_tile.dart';
import 'package:myapp/features/product_detail/widgets/description_tile.dart';
import 'package:myapp/features/product_detail/widgets/product_image_tile.dart';
import 'package:myapp/features/product_detail/widgets/product_info_tile.dart';
import 'package:myapp/features/product_detail/widgets/product_review_content.dart';
import 'package:myapp/features/product_detail/widgets/size_tile.dart';

@RoutePage()
class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final DiscoverProductCubit bloc;

  const ProductDetailScreen(
      {super.key, required this.product, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<ProductDetailCubit>(
        param1: product,
      )..getReviewList(
          reviews: product.noOfReview,
        ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PrioritySoftAppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.sp),
              child: CartIndicatorButton(
                bloc: bloc,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 30.sp,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  ProductImageTile(
                    productAssets: product.itemAssets,
                  ),
                  30.verticalSpace,
                  Text(
                    product.productName,
                    style: context.headline600,
                  ),
                  10.verticalSpace,
                  ProductInfoTile(
                    averageRating: product.averageRating,
                    noOfReview: product.noOfReview,
                  ),
                  30.verticalSpace,
                  ProductSizeTile(),
                  30.verticalSpace,
                  DescriptionTile(
                    description: product.description,
                  ),
                  30.verticalSpace,
                  ProductReviewContent(
                    noOfReview: product.noOfReview,
                    averageRating: product.averageRating,
                  ),
                  15.verticalSpace,
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: AddToCartTile(price: product.productPrice),
      ),
    );
  }
}
