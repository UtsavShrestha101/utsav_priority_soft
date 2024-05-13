import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/core/models/product.dart';
import 'package:uuid/uuid.dart';

@singleton
class OrderRepository {
  final cartCollection = FirebaseFirestore.instance.collection('order');


  // this function is used to add order to the server
  Future<void> addOrder(List<Product> productList, double totalPrice) async {
    // it is used to get unique id for each device It will be same even after uninstalling and installing the app
    String userUID = await FlutterUdid.udid;
    // it is used to get unique id for order
    String orderUID = const Uuid().v4();
    List<Map<String, dynamic>> orderItems = [];
    for (var product in productList) {
      orderItems.add(product.toJson());
    }

    //to add data in the server 
    // order => userUid => myOrders => orderUId => orderData
    await cartCollection.doc(userUID).collection("myOrders").doc(orderUID).set(
      {
        "orderUid": orderUID,
        "totalPrice": totalPrice,
        "orderItem": orderItems,
        "createdAt": Timestamp.now(),
      },
    );
  }
}
