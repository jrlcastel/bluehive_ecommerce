import 'package:bluehive_exam/controllers/repositories/firebase_storage_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {

  final String id;
  final String name;
  final String description;
  final double price;
  final Future<String> imageUrl;
  
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });


  static Product fromSnapshot(DocumentSnapshot snapshot) {

    final _data = snapshot.data() as Map<String, dynamic>;

    return Product(
      id: snapshot.id,
      name: _data['name'] ?? 'empty',
      description: _data['description'] ?? 'empty',
      // price: 0,
      price: _data['price']==null ? 0 :  (_data['price'] as num).toDouble(),
      imageUrl: _data['image_url']==null ? FirebaseStorageRepository().getDownloadUrl(imgUrl: 'thumb.png') : FirebaseStorageRepository().getDownloadUrl(imgUrl: _data['image_url']),
    );

  }


}