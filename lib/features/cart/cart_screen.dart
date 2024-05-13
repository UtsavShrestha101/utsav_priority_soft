import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/dependency_injection/di.dart';
import 'package:myapp/core/extensions/context_extension.dart';
import 'package:myapp/core/models/product.dart';
import 'package:myapp/core/router/app_router.dart';
import 'package:myapp/core/ui/widget/bottom_detail_bar.dart';
import 'package:myapp/core/ui/widget/empty_alert_tile.dart';
import 'package:myapp/core/ui/widget/priority_soft_app_bar.dart';
import 'package:myapp/features/cart/cubit/cart_cubit.dart';
import 'package:myapp/features/cart/widget/cart_tile.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<CartCubit>()..getCartData(),
      child: Scaffold(
        appBar: const PrioritySoftAppBar(
          text: "Cart",
          centerTitle: true,
        ),
        body: BlocConsumer<CartCubit, AsyncValue<CartState>>(
          listener: (context, state) {
            if (state.data!.msg != "") {
              context.showSuccessBar(
                state.data!.msg,
              );
            }
          },
          builder: (context, state) {
            return (state.isLoading && state.data!.isListEmpty)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.hasError
                    ? Text(state.errorMessage)
                    : state.data!.isListEmpty
                        ? const EmptyAlertTile(msg: "Oops, Your cart is empty")
                        : SafeArea(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 30.sp,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                        itemCount: state.data!.cartItems.length,
                                        itemBuilder: (context, index) {
                                          Product product =
                                              state.data!.cartItems[index];
                                          return CartTile(product: product);
                                        }),
                                  ),
                                  BottomDetailBar(
                                    buttonLabel: "CHECK OUT",
                                    title: "Grand Price",
                                    onPress: () {
                                      context.router.push(
                                        OrderSummaryRoute(
                                          productList: state.data!.cartItems,
                                          cartCubit: context.read<CartCubit>(),
                                        ),
                                      );
                                    },
                                    totalPrice: state.data!.totalPrice,
                                    isLoading: false,
                                  ),
                                  10.verticalSpace,
                                ],
                              ),
                            ),
                          );
          },
        ),
      ),
    );
  }
}
