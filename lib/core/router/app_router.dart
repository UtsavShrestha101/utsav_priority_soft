import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:auto_route/auto_route.dart';
import 'package:myapp/core/models/product.dart';
import 'package:myapp/features/cart/cart_screen.dart';
import 'package:myapp/features/cart/cubit/cart_cubit.dart';
import 'package:myapp/features/discover_product/cubit/discover_product_cubit.dart';
import 'package:myapp/features/discover_product/discover_product_screen.dart';
import 'package:myapp/features/filter/filter_screen.dart';
import 'package:myapp/features/product_detail/product_detail_screen.dart';
import 'package:myapp/features/review/reviews_screen.dart';
import 'package:myapp/features/order_summary/order_summary_screen.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override

  // setting routes for the app
  
  List<AutoRoute> get routes => [
        AutoRoute(
          page: DiscoverProductRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: ProductDetailRoute.page,
        ),
        AutoRoute(
          page: ReviewsRoute.page,
        ),
        AutoRoute(
          page: CartRoute.page,
        ),
        AutoRoute(
          page: OrderSummaryRoute.page,
        ),
        AutoRoute(
          page: FilterRoute.page,
        ),
      ];
}
