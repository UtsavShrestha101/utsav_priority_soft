// class FirebaseException implements Exception {
//   final String message;

//   const FirebaseException({
//     required this.message,
//   });

//   factory FirebaseException.fromError(FirebaseException error) {
//     return FirebaseException(
//       message: error.message,
//     );
//   }

//   static FirebaseException handleException(Exception error) {
//     if (error is FirebaseException) {
//       return error;
//     } else {
//       // Handle other unexpected exceptions
//       rethrow;
//     }
//   }
// }
