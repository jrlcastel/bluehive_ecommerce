import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/blocs/transaction_details_bloc/transaction_details_bloc.dart';
import 'transaction_details_widget.dart';

class TransactionDetailsList extends StatelessWidget {
  const TransactionDetailsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionDetailsBloc, TransactionDetailsState>(
      builder: (context, state) {
        
        // * Loaded
        if(state is TransactionDetailsLoaded) {
          return SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(
              children: List.generate(state.transactionDetailsList.length, (index) 
                => TransactionDetailsWidget(
                  transactionDetails: state.transactionDetailsList[index],
                )
              ),
            ),
          );
        }
        // * Loading
        else if (state is TransactionDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        // * Other states
        else {
          return Container();
        } 

      },
    );
  }
}