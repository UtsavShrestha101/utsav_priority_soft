import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/colors/app_colors.dart';
import 'package:myapp/features/order_summary/cubit/order_summary_cubit.dart';
import 'package:myapp/features/order_summary/widgets/price_tile.dart';

class PaymentDetailContent extends StatelessWidget {
  const PaymentDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSummaryCubit, AsyncValue<OrderSummaryState>>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment Detail",
              style: context.headline500,
            ),
            20.verticalSpace,
            PriceTile(
              title: "Sub Total",
              price: state.data!.totalPrice,
              style: context.headline400,
            ),
            20.verticalSpace,
            PriceTile(
              title: "Shipping",
              price: 20,
              style: context.headline400,
            ),
            20.verticalSpace,
            const Divider(
              color: AppColors.primaryNeutral100,
            ),
            20.verticalSpace,
            PriceTile(
              title: "Total Order",
              price: state.data!.totalPrice + 20,
              style: context.headline500,
            ),
          ],
        );
      },
    );
  }
}
