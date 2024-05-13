import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/models/product.dart';
import 'package:myapp/features/discover_product/cubit/discover_product_cubit.dart';
import 'package:myapp/features/discover_product/widgets/product_grid_tile.dart';

class ProductGridContent extends StatelessWidget {
  const ProductGridContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverProductCubit, AsyncValue<DiscoverProductState>>(
      builder: (context, state) {
        return Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              final metrics = notification.metrics;

              if (metrics.extentAfter <= metrics.maxScrollExtent * 0.9) {
                // context.read<DiscoverProductCubit>().fetchMoreProductList();
              }

              return false;
            },
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.data!.productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.sp,
                mainAxisSpacing: 10.sp,
                childAspectRatio: 0.6.sp,
              ),
              itemBuilder: (context, index) {
                Product product = state.data!.productList[index];
                return ProductGridTile(product: product);
              },
            ),
          ),
        );
      },
    );
  }
}
