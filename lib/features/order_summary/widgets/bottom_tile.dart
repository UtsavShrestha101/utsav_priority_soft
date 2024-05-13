import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/ui/widget/bottom_detail_bar.dart';
import 'package:myapp/features/order_summary/cubit/order_summary_cubit.dart';

class BottomTile extends StatelessWidget {
  const BottomTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderSummaryCubit, AsyncValue<OrderSummaryState>>(
      listener: (BuildContext context, AsyncValue<OrderSummaryState> state) {
        state.whenOrNull(
            error: (_, message) => context.showErrorSnackBar(message),
            data: (data) {
              context.showSuccessBar(
                "Order added to server successfully",
              );
              context.router.popUntilRoot();
            });
      },
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(
            left: 30.sp,
            right: 30.sp,
            bottom: 10.sp,
          ),
          height: 50.sp,
          child: BottomDetailBar(
            buttonLabel: "PAYMENT",
            title: "Grand Total",
            onPress: () async {
              context.read<OrderSummaryCubit>().checkOut();
            },
            totalPrice: state.data!.totalPrice + 20,
            //  state.data!.totalPrice,
            isLoading: state.isLoading,
          ),
        );
      },
    );
  }
}
