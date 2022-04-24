
import 'package:bluehive_exam/controllers/repositories/product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'product.dart';

class CartProduct {

  final String id;
  final String productId;
  final String userId;
  final int quantity;
  // final Product product;

  CartProduct({
    required this.id,
    required this.userId,
    required this.productId,
    required this.quantity,
    // required this.product,
  });


  static CartProduct fromSnapshot(DocumentSnapshot snapshot) {

    final _data = snapshot.data() as Map<String, dynamic>;

    return CartProduct(
      id: snapshot.id,
      productId: _data['product_id'] ?? 'empty',
      userId: _data['user_id'] ?? 'empty',
      quantity: _data['quantity']==null ? 0 :  (_data['quantity'] as num).toInt(),
      // product: await ProductRepository(firebaseFirestore: FirebaseFirestore.instance).getProductById(id: _data['productId']),
    );

  }


}