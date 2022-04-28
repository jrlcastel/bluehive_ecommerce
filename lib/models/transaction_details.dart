import 'package:cloud_firestore/cloud_firestore.dart';

import 'order.dart';

class TransactionDetails {

  final String id;
  final String userId;
  final DateTime? dateTime;
  final double total;
  final int quantity;

  TransactionDetails({
    required this.id,
    required this.userId,
    required this.dateTime,
    required this.total,
    required this.quantity,
  });

  


  static TransactionDetails fromSnapshot(DocumentSnapshot snapshot) {

    final _data = snapshot.data() as Map<String, dynamic>;

    return TransactionDetails(
      id: snapshot.id,
      userId: _data['user_id'] ?? 'unknown',
      dateTime: _data['timestamp']==null ? null : DateTime.parse(_data['timestamp'].toDate().toString()),
      total: double.parse((_data['total'] ?? 0.0).toString()),
      quantity: _data['quantity'] ?? 0,
    );

  }

}