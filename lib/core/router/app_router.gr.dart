// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartScreen(),
      );
    },
    DiscoverProductRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DiscoverProductScreen(),
      );
    },
    FilterRoute.name: (routeData) {
      final args = routeData.argsAs<FilterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FilterScreen(
          key: args.key,
          cubit: args.cubit,
        ),
      );
    },
    OrderSummaryRoute.name: (routeData) {
      final args = routeData.argsAs<OrderSummaryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderSummaryScreen(
          key: args.key,
          productList: args.productList,
          cartCubit: args.cartCubit,
        ),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductDetailScreen(
          key: args.key,
          product: args.product,
          bloc: args.bloc,
        ),
      );
    },
    ReviewsRoute.name: (routeData) {
      final args = routeData.argsAs<ReviewsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReviewsScreen(
          key: args.key,
          averageRating: args.averageRating,
          noOfReviews: args.noOfReviews,
        ),
      );
    },
  };
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DiscoverProductScreen]
class DiscoverProductRoute extends PageRouteInfo<void> {
  const DiscoverProductRoute({List<PageRouteInfo>? children})
      : super(
          DiscoverProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverProductRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FilterScreen]
class FilterRoute extends PageRouteInfo<FilterRouteArgs> {
  FilterRoute({
    Key? key,
    required DiscoverProductCubit cubit,
    List<PageRouteInfo>? children,
  }) : super(
          FilterRoute.name,
          args: FilterRouteArgs(
            key: key,
            cubit: cubit,
          ),
          initialChildren: children,
        );

  static const String name = 'FilterRoute';

  static const PageInfo<FilterRouteArgs> page = PageInfo<FilterRouteArgs>(name);
}

class FilterRouteArgs {
  const FilterRouteArgs({
    this.key,
    required this.cubit,
  });

  final Key? key;

  final DiscoverProductCubit cubit;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key, cubit: $cubit}';
  }
}

/// generated route for
/// [OrderSummaryScreen]
class OrderSummaryRoute extends PageRouteInfo<OrderSummaryRouteArgs> {
  OrderSummaryRoute({
    Key? key,
    required List<Product> productList,
    required CartCubit cartCubit,
    List<PageRouteInfo>? children,
  }) : super(
          OrderSummaryRoute.name,
          args: OrderSummaryRouteArgs(
            key: key,
            productList: productList,
            cartCubit: cartCubit,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderSummaryRoute';

  static const PageInfo<OrderSummaryRouteArgs> page =
      PageInfo<OrderSummaryRouteArgs>(name);
}

class OrderSummaryRouteArgs {
  const OrderSummaryRouteArgs({
    this.key,
    required this.productList,
    required this.cartCubit,
  });

  final Key? key;

  final List<Product> productList;

  final CartCubit cartCubit;

  @override
  String toString() {
    return 'OrderSummaryRouteArgs{key: $key, productList: $productList, cartCubit: $cartCubit}';
  }
}

/// generated route for
/// [ProductDetailScreen]
class ProductDetailRoute extends PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    Key? key,
    required Product product,
    required DiscoverProductCubit bloc,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailRoute.name,
          args: ProductDetailRouteArgs(
            key: key,
            product: product,
            bloc: bloc,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static const PageInfo<ProductDetailRouteArgs> page =
      PageInfo<ProductDetailRouteArgs>(name);
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.product,
    required this.bloc,
  });

  final Key? key;

  final Product product;

  final DiscoverProductCubit bloc;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, product: $product, bloc: $bloc}';
  }
}

/// generated route for
/// [ReviewsScreen]
class ReviewsRoute extends PageRouteInfo<ReviewsRouteArgs> {
  ReviewsRoute({
    Key? key,
    required double averageRating,
    required int noOfReviews,
    List<PageRouteInfo>? children,
  }) : super(
          ReviewsRoute.name,
          args: ReviewsRouteArgs(
            key: key,
            averageRating: averageRating,
            noOfReviews: noOfReviews,
          ),
          initialChildren: children,
        );

  static const String name = 'ReviewsRoute';

  static const PageInfo<ReviewsRouteArgs> page =
      PageInfo<ReviewsRouteArgs>(name);
}

class ReviewsRouteArgs {
  const ReviewsRouteArgs({
    this.key,
    required this.averageRating,
    required this.noOfReviews,
  });

  final Key? key;

  final double averageRating;

  final int noOfReviews;

  @override
  String toString() {
    return 'ReviewsRouteArgs{key: $key, averageRating: $averageRating, noOfReviews: $noOfReviews}';
  }
}
