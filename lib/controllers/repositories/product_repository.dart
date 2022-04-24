import 'package:bluehive_exam/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductRepository {

  FirebaseFirestore firebaseFirestore;

  ProductRepository({
    required this.firebaseFirestore
  });


  // * get PRODUCT by ID
  Future<Product> getProductById({required String id}) async {
    debugPrint('id: ' + id);
    var collection = firebaseFirestore.collection('products');
    var docSnapshot = await collection.doc(id).get();
    return Product.fromSnapshot(docSnapshot);
  }


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
