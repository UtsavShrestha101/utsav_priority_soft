import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/models/product.dart';
import 'package:myapp/features/order_summary/widgets/price_tile.dart';

class OrderDetailTile extends StatelessWidget {
  final Product product;
  const OrderDetailTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.productName,
            style: context.headline400,
          ),
          10.verticalSpace,
          PriceTile(
            title:
                "${categoryType(product.category)} . ${product.color} . ${product.size}. Qty ${product.quantity}",
            price: (product.productPrice * product.quantity).toDouble(),
          ),
        ],
      ),
    );
  }
}
