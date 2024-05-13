import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/dependency_injection/di.dart';
import 'package:myapp/core/models/product.dart';
import 'package:myapp/core/ui/widget/priority_soft_app_bar.dart';
import 'package:myapp/features/cart/cubit/cart_cubit.dart';
import 'package:myapp/features/order_summary/cubit/order_summary_cubit.dart';
import 'package:myapp/features/order_summary/widgets/bottom_tile.dart';
import 'package:myapp/features/order_summary/widgets/information_content.dart';
import 'package:myapp/features/order_summary/widgets/order_detail_content.dart';
import 'package:myapp/features/order_summary/widgets/payment_detail_content.dart';

@RoutePage()
class OrderSummaryScreen extends StatefulWidget {
  final CartCubit cartCubit;
  final List<Product> productList;
  const OrderSummaryScreen(
      {super.key, required this.productList, required this.cartCubit});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  @override
  void dispose() {
    widget.cartCubit.getCartData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<OrderSummaryCubit>(param1: widget.productList),
      child: Scaffold(
        appBar: const PrioritySoftAppBar(
          text: "Order Summary",
          centerTitle: true,
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
                  30.verticalSpace,
                  const InformationContent(),
                  30.verticalSpace,
                  const OrderDetailContent(),
                  10.verticalSpace,
                  const PaymentDetailContent(),
                  30.verticalSpace,
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const BottomTile(),
      ),
    );
  }
}
