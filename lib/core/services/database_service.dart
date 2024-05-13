import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/core/models/product.dart';

@singleton
class DatabaseService {
  @PostConstruct(preResolve: true)
  Future<void> initialize() async {
    await Hive.initFlutter();
    _registerAdapters();
    await _openBoxes();
  }

  DatabaseService();

  // **************************************************************************
  // Declare Box Here
  // **************************************************************************

  late Box<Product> _myCartBox;

  // **************************************************************************
  // Open Box Here
  // **************************************************************************
  Future<void> _openBoxes() async {
    _myCartBox = await Hive.openBox('myCart');
  }

  // **************************************************************************
  // Register Adapter
  // **************************************************************************
  void _registerAdapters() {
    Hive.registerAdapter(ProductAdapter());
    Hive.registerAdapter(CategoryTypeAdapter());
  }

  // **************************************************************************
  // Database Functions
  // **************************************************************************

  // to add to cart

  Future<void> addToCart(Product product) async {
    await _myCartBox.put(product.productId, product);
  }

  // to get all data of cart

  Future<List<Product>> getAllCartData() async {
    return _myCartBox.values.toList();
  }

  // to update data of cart


  Future<void> updateCart(Product product) async {
    await addToCart(product);
  }

  // to delete single data from cart

  Future<void> deleteSingleItemCart(String productId) async {
    await _myCartBox.delete(productId);
  }

  // to clear all data from cart

  Future<void> clearCart() async {
    await _myCartBox.clear();
  }

  // to get length of cart item

  int? get cartLength => _myCartBox.values.length;

  // to get length of cart item in stream

  Stream<int?> get cartLengthStream =>
      _myCartBox.watch().map((event) => _myCartBox.values.length);
}
