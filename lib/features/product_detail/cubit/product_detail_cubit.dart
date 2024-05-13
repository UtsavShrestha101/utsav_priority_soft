import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/models/product.dart';
import 'package:myapp/core/models/review.dart';
import 'package:myapp/core/repository/review_repository.dart';
import 'package:myapp/core/services/database_service.dart';
import 'package:myapp/core/services/push_notification.dart';

part 'product_detail_state.dart';
part 'product_detail_cubit.freezed.dart';

@injectable
class ProductDetailCubit extends BaseAsyncCubit<ProductDetailState> {
  final ReviewRepository reviewRepository;
  final PushNotificationService pushNotificationService;
  final Product product;
  final DatabaseService databaseService;
  ProductDetailCubit(this.reviewRepository, @factoryParam this.product,
      this.pushNotificationService, this.databaseService) {
    emit(AsyncValue.initial(data: ProductDetailState(product: product)));
  }

  Future<void> getReviewList({required int reviews}) async {
    emit(AsyncValue.loading(data: state.data!));
    await runguarded(() async {
      List<Review> reviewList = await reviewRepository.getLatestList(
          limit: reviews > 3 ? 3 : reviews);
      return state.data!.copyWith(latestReviewList: reviewList);
    });
  }

  Future<void> selectProductSize(double size) async {
    emit(
      AsyncValue.initial(
        data: state.data!.copyWith(
          productSizeSelect: size,
        ),
      ),
    );
  }

  Future<void> selectProductColor(int index) async {
    emit(
      AsyncValue.initial(
        data: state.data!.copyWith(
          productColorSelect: index,
        ),
      ),
    );
  }

  Future<void> resetQuantity() async {
    emit(
      AsyncValue.initial(
        data: state.data!.copyWith(
          quantity: 1,
        ),
      ),
    );
  }

  Future<void> sendPushNotification() async {
    await pushNotificationService.displayBigNotification(
      state.data!.product.productName,
      "Product has been added to cart",
      state.data!.product.itemAssets[0],
    );
  }

  Future<void> addToCart() async {
    emit(AsyncValue.loading(data: state.data!));
    await runguarded(() async {
      Product product = state.data!.product.copyWith(
        size: state.data!.productSizeSelect,
        quantity: state.data!.quantity,
        color: colorType(state.data!.productColorSelect),
      );

      await databaseService.addToCart(product);
      await sendPushNotification();
      return state.data!;
    });
  }

  Future<void> updateQuantity(int quantity) async {
    emit(
      AsyncValue.initial(
        data: state.data!.copyWith(
          quantity: quantity,
        ),
      ),
    );
  }
}

String colorType(
  int productColor,
) {
  switch (productColor) {
    case 0:
      return "White";
    case 1:
      return "Black";
    case 2:
      return "Blue Grey";
    case 3:
      return "Blue";
    default:
      return "White";
  }
}
