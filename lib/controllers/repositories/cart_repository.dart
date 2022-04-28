import 'package:bluehive_exam/models/cart_product.dart';
import 'package:bluehive_exam/models/cart_product_entry.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class CartRepository {

  final FirebaseFirestore firebaseFirestore;

  CartRepository({
    required this.firebaseFirestore
  });

  Future<void> deleteUserCartItems({
    required String userId,
  }) async {

    debugPrint('userId: $userId');

    try{  

      firebaseFirestore.collection('cart')
        .where('user_id', isEqualTo: userId)
        .get()
        .then((QuerySnapshot querySnapshot) async {
          for (var doc in querySnapshot.docs) {
            doc.reference.delete();
          }
        });
 
      // delete each of the user's cart item
      // Query<Map<String, dynamic>> _query = firebaseFirestore.collection('cart').where('user_id', isEqualTo: userId);
      // List<QuerySnapshot<Map<String, dynamic>>> _list  = await _query.snapshots().toList();
      // _list[0].docs.remove(value)

      //   .snapshots()
      //   .forEach((element) {
      //     element.docs.removeWhere((element) => element['user_id']==userId);
      //   });
      //   // .map((snapshot)
      //   //   => snapshot.docs.map((doc) async {
      //   //     debugPrint('  should delete: ${doc.id}');
      //   //     await deleteCartItem(cartId: doc.id);
      //   //   })
      //   // );
        
    }
     catch(e) {
       rethrow;
    }

  }

  Future<void> deleteCartItem({
    required String cartId,
  }) async {

    debugPrint('delete: $cartId');
    
    try{
    await firebaseFirestore
      .collection('cart')
      .doc(cartId)
      .delete();
    } catch (e) {rethrow;}

  }


  Future<void> updateCartItem({
    required String cartId,
    required int quantity,
  }) async {

    // delete
    if(quantity<=0) {
      // delete
      await deleteCartItem(cartId: cartId);
    }
    // update
    else {
      await firebaseFirestore
        .collection('cart')
        .doc(cartId)
        .update({
          'quantity': quantity,
        });
    }

  }

  Future<bool> addToCart({
    required String userId,
    required String productId,
    required int quantity,
  }) async {
    
    try {

      // check product is already in cart
      CartProductEntry? _cartProductEntry = await inCart(
        productId: productId,
        userId: userId,
      );

      // if not in cart, add to cart directly
      if(_cartProductEntry==null) {
        await firebaseFirestore.collection('cart').add({
          'product_id': productId,
          'quantity': quantity,
          'user_id': userId,
        });
      }
      // if in cart, update the entry
      else {
        
        // update
        await firebaseFirestore
          .collection('cart')
          .doc(_cartProductEntry.firestoreId)
          .update({
            'quantity': _cartProductEntry.cartProduct.quantity + quantity,
          });

      }
      
      return true;

    } on Exception catch (_) {

      return false;

    }

  }

  
  // * Stream ALL cart items
  Stream<List<CartProduct>> getUserCartProducts ({
    required String userId
  }) {

    return firebaseFirestore
      .collection('cart')
      .where('user_id', isEqualTo: userId)
      .snapshots()
      .map((snapshot)
        => snapshot.docs.map((doc) 
          => CartProduct.fromSnapshot(doc)
        ).toList() 
      );
  }


  // * helper function
  Future<CartProductEntry?> inCart ({
    required String userId,
    required String productId,
  }) async {

    QuerySnapshot<Map<String, dynamic>> _query = await firebaseFirestore
      .collection('cart')
      .where('user_id', isEqualTo: userId)
      .where('product_id', isEqualTo: productId)
      .get();

    if(_query.docs.isNotEmpty) {
      return CartProductEntry(
        cartProduct: CartProduct.fromSnapshot(_query.docs.first),
        firestoreId: _query.docs.first.id
      );
    } else {
      return null;
    }

  }

}