import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/core/models/review.dart';

@Singleton()
class ReviewRepository {
  // get  reviews in pagination style where the is 10 items per page

  /*
Rating start and the range it holds

1 star => 0-0.9 star range 
2 star => 1-1.9 star range
3 star => 2-2.9 star range
4 star => 3-3.9 star range
5 star => 4-5 star range

*/
  Future<List<Review>> getLatestList({
    int limit = 10,
    double? minRating = 0.0,
    double? maxRating = 5.0,
    Review? lastItem,
  }) async {
    Query reviewCollection = FirebaseFirestore.instance.collection('reviews');

    QuerySnapshot querySnapshot;

    //filter based  on rating
    reviewCollection = reviewCollection
        .where('rating', isGreaterThanOrEqualTo: minRating)
        .where('rating', isLessThanOrEqualTo: maxRating);

    //sort by created at time
    reviewCollection = reviewCollection.orderBy('createdAt', descending: true);

    //if last Item is not empty start by that item created at time
    if (lastItem != null) {
      reviewCollection = reviewCollection.startAfter([lastItem.createdAt]);
    }
    querySnapshot = await reviewCollection.limit(limit).get();
    return querySnapshot.docs
        .map((reviewData) =>
            Review.fromJson(reviewData.data() as Map<String, dynamic>))
        .toList();
  }
}
