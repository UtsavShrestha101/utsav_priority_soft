import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/models/product.dart';
import 'package:myapp/core/services/database_service.dart';
import 'package:myapp/core/services/push_notification.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

@injectable
class CartCubit extends BaseAsyncCubit<CartState> {
  final PushNotificationService pushNotificationService;
  final DatabaseService databaseService;
  CartCubit(this.databaseService, this.pushNotificationService) {
    emit(const AsyncValue.initial(data: CartState()));
  }

  // get all the cart item
  Future<void> getCartData() async {
    emit(
      AsyncValue.loading(
        data: state.data,
      ),
    );
    await runguarded(() async {
      List<Product> cartList = await databaseService.getAllCartData();
      double totalPrice = getTotal(cartList);
      return state.data!.copyWith(
        cartItems: cartList,
        totalPrice: totalPrice,
      );
    });
  }

  // to calculate total
  double getTotal(List<Product> cartList) {
    double totalPrice = 0.0;
    for (var product in cartList) {
      totalPrice += product.productPrice * product.quantity;
    }
    return totalPrice;
  }

  // to update quantity of product
  Future<void> updateQuantity(String productId, int quantity) async {
    List<Product> currentCart = List.from(state.data!.cartItems);
    final updateIndex =
        currentCart.indexWhere((product) => product.productId == productId);
    Product product = currentCart.removeAt(updateIndex);

    currentCart.insert(updateIndex, product.copyWith(quantity: quantity));
    double totalPrice = getTotal(currentCart);
    await databaseService.updateCart(product.copyWith(quantity: quantity));
    emit(
      AsyncValue.data(
        data: state.data!.copyWith(
          cartItems: currentCart,
          totalPrice: totalPrice,
        ),
      ),
    );
  }

  // to delete product from the cart
  Future<void> deleteProduct(String productId) async {
    emit(AsyncValue.initial(
      data: state.data!.copyWith(
        msg: "",
      ),
    ));
    List<Product> currentCart = List.from(state.data!.cartItems);
    final updateIndex =
        currentCart.indexWhere((product) => product.productId == productId);
    Product removedProduct = currentCart.removeAt(updateIndex);
    double totalPrice = getTotal(currentCart);
    await databaseService.deleteSingleItemCart(productId);
    await pushNotificationService.displaySimpleNotification(
      removedProduct.productName,
      "Product has been removed",
    );
    emit(
      AsyncValue.data(
        data: state.data!.copyWith(
          cartItems: currentCart,
          totalPrice: totalPrice,
          msg: "Product deleted from cart",
        ),
      ),
    );
  }
}
