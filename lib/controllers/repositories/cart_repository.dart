import 'package:bluehive_exam/models/cart_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartRepository {

  final FirebaseFirestore firebaseFirestore;

  CartRepository({
    required this.firebaseFirestore
  });



  Future<bool> addToCart({
    required String id,
    required String userId,
    required String productId,
    required int quantity,
  }) async {
    
    try {
      
      await firebaseFirestore.collection('cart').add({
        'id': id,
        'product_id': productId,
        'quantity': quantity,
        'user_id': userId,
      });
      return true;
    } on Exception catch (_) {
      return false;
    }

  }


  Stream<List<CartProduct>> getAllCartProducts () {
    return firebaseFirestore
      .collection('cart')
      .snapshots()
      .map((snapshot) 
        => snapshot.docs.map((doc) 
          => CartProduct.fromSnapshot(doc)
        ).toList() 
      );
  }

  

}