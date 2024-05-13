import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/models/product.dart';
import 'package:myapp/features/order_summary/cubit/order_summary_cubit.dart';
import 'package:myapp/features/order_summary/widgets/order_detail_tile.dart';

class OrderDetailContent extends StatelessWidget {
  const OrderDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSummaryCubit, AsyncValue<OrderSummaryState>>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order Detail",
              style: context.headline500,
            ),
            20.verticalSpace,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.data!.productList.length,
              itemBuilder: (context, index) {
                Product product = state.data!.productList[index];
                return OrderDetailTile(product: product);
              },
            ),
          ],
        );
      },
    );
  }
}
