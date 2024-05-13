import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/core/models/product.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

@singleton
class ProductRepository {

  // fetch product data from the server
  Future<List<Product>> getProductList({
    String? category = "",
    required String gender,
    required SfRangeValues priceRange,
    required String sortBy,
  }) async {
    Query productCollection = FirebaseFirestore.instance.collection('shoes');

    QuerySnapshot querySnapshot;

    // To filter query based on category. It will bypass if the category is All
    if (category != "All") {
      productCollection =
          productCollection.where('category', isEqualTo: category);
    }


    // To filter query based on gender. It will bypass if the gender is All
    if (gender != "All") {
      productCollection = productCollection.where('gender', isEqualTo: gender);
    }

    // To filter query based on price range
    productCollection = productCollection
        .where('productPrice', isGreaterThanOrEqualTo: priceRange.start)
        .where('productPrice', isLessThanOrEqualTo: priceRange.end);


    /*
      sortBy value can be => averageRating, productPrice, createdAt
      Based on the value of sortBy query is ordered and sorted
    */

    switch (sortBy) {
      case "averageRating":
        productCollection =
            productCollection.orderBy('averageRating', descending: true);
        break;
      case "productPrice":
        productCollection =
            productCollection.orderBy('productPrice', descending: false);
        break;
      case "createdAt":
        productCollection =
            productCollection.orderBy('createdAt', descending: true);
        break;
      default:
        break;
    }

    //once all the filtering and sorting is done we retrieve snapshots
    
    querySnapshot = await productCollection.get();

    return querySnapshot.docs
        .map((productData) =>
            Product.fromJson(productData.data() as Map<String, dynamic>))
        .toList();
  }
}
