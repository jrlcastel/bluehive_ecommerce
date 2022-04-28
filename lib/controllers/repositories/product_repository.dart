import 'package:bluehive_exam/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository {

  FirebaseFirestore firebaseFirestore;

  ProductRepository({
    required this.firebaseFirestore
  });


  // * Stream ALL products
  Stream<List<Product>> getAllProducts () {
    return firebaseFirestore
      .collection('products')
      .snapshots()
      .map((snapshot) 
        => snapshot.docs.map((doc) 
          => Product.fromSnapshot(doc)
        ).toList() 
      );
  }

}
