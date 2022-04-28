import 'package:bluehive_exam/models/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionDetailsWidget extends StatelessWidget {
  
  final TransactionDetails  transactionDetails;
  final double width;
  final EdgeInsets margin;
  final EdgeInsets padding;
  // title
  final double titleSize;
  // quantity
  final double quantitySize;
  // amount
  final double amountSize;

  const TransactionDetailsWidget({
    Key? key,
    required this.transactionDetails,
    this.width = double.infinity,
    this.margin = const EdgeInsets.fromLTRB(10, 20, 10, 0),
    this.padding = const EdgeInsets.all(10),
    // title
    this.titleSize = 25,
    // quantity
    this.quantitySize = 16,
    // amount
    this.amountSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // if(transactionDetails.dateTime==null) return Container();

    return Container(
      margin: margin,
      padding: padding,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black87),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Container(
                child: Text(
                  formatDate(transactionDetails.dateTime!),
                  style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  formatTime(transactionDetails.dateTime!),
                  style: TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ),

            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

            
                Text(
                  (transactionDetails.quantity.toString() + ' items'),
                  style: TextStyle(
                    fontSize: quantitySize,
                    fontWeight: FontWeight.normal
                  ),
                ),
            
                Text(
                  '₱ ' + transactionDetails.total.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: amountSize,
                  ),
                ),
            
              ], 
            ),
          )

          // date
          // amount
          // quantity

        ],
      ),
    );
  }

  String formatDate(DateTime _datetime) {

    var _formatDate = DateFormat.MMMEd();
    String _dateString = _formatDate.format(_datetime);

    return _dateString;

  }
  String formatTime(DateTime _datetime) {

    var _formatTime = DateFormat('h:mm');
    String _dateString = _formatTime.format(_datetime);

    return _dateString;

  }

}