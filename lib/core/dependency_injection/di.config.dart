// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:myapp/core/models/product.dart' as _i11;
import 'package:myapp/core/repository/order_repository.dart' as _i3;
import 'package:myapp/core/repository/product_repository.dart' as _i4;
import 'package:myapp/core/repository/review_repository.dart' as _i5;
import 'package:myapp/core/router/app_router.dart' as _i6;
import 'package:myapp/core/services/database_service.dart' as _i7;
import 'package:myapp/core/services/firebase_service.dart' as _i8;
import 'package:myapp/core/services/push_notification.dart' as _i9;
import 'package:myapp/features/cart/cubit/cart_cubit.dart' as _i15;
import 'package:myapp/features/discover_product/cubit/discover_product_cubit.dart'
    as _i13;
import 'package:myapp/features/order_summary/cubit/order_summary_cubit.dart'
    as _i12;
import 'package:myapp/features/product_detail/cubit/product_detail_cubit.dart'
    as _i10;
import 'package:myapp/features/review/cubit/reviews_cubit.dart' as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.OrderRepository>(() => _i3.OrderRepository());
    gh.singleton<_i4.ProductRepository>(() => _i4.ProductRepository());
    gh.singleton<_i5.ReviewRepository>(() => _i5.ReviewRepository());
    gh.singleton<_i6.AppRouter>(() => _i6.AppRouter());
    await gh.singletonAsync<_i7.DatabaseService>(
      () {
        final i = _i7.DatabaseService();
        return i.initialize().then((_) => i);
      },
      preResolve: true,
    );
    await gh.singletonAsync<_i8.FirebaseService>(
      () {
        final i = _i8.FirebaseService();
        return i.initialize().then((_) => i);
      },
      preResolve: true,
    );
    await gh.singletonAsync<_i9.PushNotificationService>(
      () {
        final i = _i9.PushNotificationService();
        return i.initialize().then((_) => i);
      },
      preResolve: true,
    );
    gh.factoryParam<_i10.ProductDetailCubit, _i11.Product, dynamic>((
      product,
      _,
    ) =>
        _i10.ProductDetailCubit(
          gh<_i5.ReviewRepository>(),
          product,
          gh<_i9.PushNotificationService>(),
          gh<_i7.DatabaseService>(),
        ));
    gh.factoryParam<_i12.OrderSummaryCubit, List<_i11.Product>, dynamic>((
      productList,
      _,
    ) =>
        _i12.OrderSummaryCubit(
          productList,
          gh<_i3.OrderRepository>(),
          gh<_i9.PushNotificationService>(),
          gh<_i7.DatabaseService>(),
        ));
    gh.factory<_i13.DiscoverProductCubit>(() => _i13.DiscoverProductCubit(
          gh<_i4.ProductRepository>(),
          gh<_i7.DatabaseService>(),
        ));
    gh.factory<_i14.ReviewsCubit>(
        () => _i14.ReviewsCubit(gh<_i5.ReviewRepository>()));
    gh.factory<_i15.CartCubit>(() => _i15.CartCubit(
          gh<_i7.DatabaseService>(),
          gh<_i9.PushNotificationService>(),
        ));
    return this;
  }
}
