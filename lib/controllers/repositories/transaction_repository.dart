import 'package:bluehive_exam/controllers/blocs/transaction_details_bloc/transaction_details_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/transaction_details.dart';

class TransactionDetailsRepository {

  FirebaseFirestore firebaseFirestore;

  TransactionDetailsRepository({
    required this.firebaseFirestore
  });


  // * Add new transaction details
  Future<bool> addTransactionDetails({
    required String userId,
    required int quantity,
    required double total,
  }) async {
    
    try {

      await firebaseFirestore.collection('transactions').add({
        'quantity': quantity,
        'total': total,
        'user_id': userId,
        'timestamp': Timestamp.fromDate(DateTime.now()),
      });
      
      return true;

    } on Exception catch (_) {

      rethrow;

    }

  }


  // * Stream user Transactions
  Stream<List<TransactionDetails>> getUserTransactions ({
    required String userId
  }) {
    return firebaseFirestore
      .collection('transactions')
      .where('user_id', isEqualTo: userId)
      // .orderBy('timestamp', descending: true)
      .snapshots()
      .map((snapshot) 
        => snapshot.docs.map((doc) 
          => TransactionDetails.fromSnapshot(doc)
        ).toList() 
    );
  }

}