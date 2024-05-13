import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/core/base/base_async_cubit.dart';
import 'package:myapp/core/models/product.dart';
import 'package:myapp/core/repository/order_repository.dart';
import 'package:myapp/core/services/database_service.dart';
import 'package:myapp/core/services/push_notification.dart';

part 'order_summary_state.dart';
part 'order_summary_cubit.freezed.dart';

@injectable
class OrderSummaryCubit extends BaseAsyncCubit<OrderSummaryState> {
  final List<Product> productList;
  final OrderRepository orderRepository;
  final PushNotificationService pushNotificationService;
  final DatabaseService databaseService;
  OrderSummaryCubit(@factoryParam this.productList, this.orderRepository,
      this.pushNotificationService, this.databaseService) {
    double totalPrice = getTotal(productList);
    emit(
      AsyncValue.initial(
        data: OrderSummaryState(
          productList: productList,
          totalPrice: totalPrice,
        ),
      ),
    );
  }

  double getTotal(List<Product> cartList) {
    double totalPrice = 0.0;
    for (var product in cartList) {
      totalPrice += product.productPrice * product.quantity;
    }
    return totalPrice;
  }

  Future<void> checkOut() async {
    emit(AsyncValue.loading(data: state.data));
    await runguarded(() async {
      await orderRepository.addOrder(productList, state.data!.totalPrice + 20);
      await pushNotificationService.displaySimpleNotification(
          "Order placed", "Order placed successfully");
      await databaseService.clearCart();
      return state.data!;
    });
  }
}
