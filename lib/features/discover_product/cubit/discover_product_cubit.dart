import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/models/product.dart';
import 'package:myapp/core/repository/product_repository.dart';
import 'package:myapp/core/services/database_service.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

part 'discover_product_state.dart';
part 'discover_product_cubit.freezed.dart';

@injectable
class DiscoverProductCubit extends BaseAsyncCubit<DiscoverProductState> {
  final ProductRepository productRepository;
  final DatabaseService databaseService;
  StreamSubscription? cartLengthSubscription;

  DiscoverProductCubit(this.productRepository, this.databaseService) {
    emit(const AsyncValue.initial(data: DiscoverProductState()));
  }

  // to switch category
  Future<void> changeCategory(String category) async {
    emit(
      AsyncValue.initial(
        data: DiscoverProductState(
          category: category,
          cartLength: state.data!.cartLength,
        ),
      ),
    );
    await getProductList();
  }
  // d506f2caeb146210

  // for pull to refresh feature
  Future<void> refreshContent() async {
    await changeCategory(state.data!.category);
  }

  //get all product list
  Future<void> getProductList({String? category}) async {
    emit(AsyncValue.loading(data: state.data!));
    await runguarded(() async {
      List<Product> productsList = await productRepository.getProductList(
        category: category ?? state.data!.category,
        gender: genderSelect(state.data!.genderChoice),
        priceRange: state.data!.rangeChoice,
        sortBy: sortBy(state.data!.sortByChoice),
      );
      return state.data!.copyWith(
        productList: productsList,
        reachedEnd: productsList.length < 10,
      );
    });
  }

  // to get cart item count and set stream
  Future<void> initCartLengthListener() async {
    int cartLength = databaseService.cartLength ?? 0;
    emit(
      AsyncValue.initial(
        data: state.data!.copyWith(cartLength: cartLength),
      ),
    );
    cartLengthSubscription =
        databaseService.cartLengthStream.listen((myCartLength) {
      emit(
        AsyncValue.initial(
          data: state.data!.copyWith(cartLength: myCartLength!),
        ),
      );
    });
  }

  //  to close stream
  @override
  Future<void> close() {
    cartLengthSubscription?.cancel();
    return super.close();
  }

  // to choose branch in filter section
  Future<void> chooseBrand(int brandIndex) async {
    emit(
      AsyncValue.initial(
        data: state.data!.copyWith(
          brandChoice: brandIndex,
          filterApplied: state.data!.brandChoice == -1
              ? state.data!.filterApplied + 1
              : state.data!.filterApplied,
        ),
      ),
    );
  }

  // to choose sortBy in filter section
  Future<void> chooseSortBy(int sortByIndex) async {
    emit(
      AsyncValue.initial(
        data: state.data!.copyWith(
          sortByChoice: sortByIndex,
          filterApplied: state.data!.sortByChoice == -1
              ? state.data!.filterApplied + 1
              : state.data!.filterApplied,
        ),
      ),
    );
  }

  // to choose gender in filter section
  Future<void> chooseGender(int genderIndex) async {
    emit(
      AsyncValue.initial(
        data: state.data!.copyWith(
          genderChoice: genderIndex,
          filterApplied: state.data!.genderChoice == -1
              ? state.data!.filterApplied + 1
              : state.data!.filterApplied,
        ),
      ),
    );
  }

  // to choose price range in filter section
  Future<void> choosePriceRange(SfRangeValues value) async {
    emit(
      AsyncValue.initial(
        data: state.data!.copyWith(
          rangeChoice: value,
        ),
      ),
    );
  }

  // to choose color in filter section
  Future<void> chooseColor(int colorIndex) async {
    emit(
      AsyncValue.initial(
        data: state.data!.copyWith(
          colorChoice: colorIndex,
          filterApplied: state.data!.colorChoice == -1
              ? state.data!.filterApplied + 1
              : state.data!.filterApplied,
        ),
      ),
    );
  }

  // to reset all filter option in filter section
  Future<void> resetAll() async {
    emit(
      AsyncValue.initial(
        data: state.data!.copyWith(
            brandChoice: -1,
            sortByChoice: -1,
            genderChoice: -1,
            colorChoice: -1,
            filterApplied: 0,
            rangeChoice: const SfRangeValues(0, 450.0)),
      ),
    );
    await getProductList(category: categoryType(state.data!.brandChoice));
  }

  // to apply filter
  Future<void> filter() async {
    emit(AsyncValue.data(
      data: state.data!.copyWith(
        category: "All",
      ),
    ));
    await getProductList(category: categoryType(state.data!.brandChoice));
  }
}

// to convert category int to category string
String categoryType(
  int categoryInt,
) {
  switch (categoryInt) {
    case 0:
      return "Nike";
    case 1:
      return "Jordan";
    case 2:
      return "Adidas";
    case 3:
      return "Reebok";
    case 4:
      return "Puma";
    default:
      return "All";
  }
}

// to convert sortBy int to sortBy string
String sortBy(
  int sortByChoice,
) {
  switch (sortByChoice) {
    case 0:
      return "createdAt";
    case 1:
      return "productPrice";
    case 2:
      return "averageRating";
    default:
      return "createdAt";
  }
}

// to convert genderSelect int to genderSelect string
String genderSelect(
  int genderChoice,
) {
  switch (genderChoice) {
    case 0:
      return "Male";
    case 1:
      return "Female";
    case 2:
      return "Unisex";
    default:
      return "All";
  }
}
