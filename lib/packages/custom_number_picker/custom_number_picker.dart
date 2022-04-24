import 'package:flutter/material.dart';

class CustomNumberPicker extends StatelessWidget {
  final int value;
  final Function(int) onChange;
  const CustomNumberPicker({
    Key? key,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1)
      ),
      child: Row(
        children: [


          Expanded(
            child: Container(
              child: Center(child: Icon(Icons.remove, size: 25)),
            )
          ),
          
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(width: 1, color: Colors.grey),
                  left: BorderSide(width: 1, color: Colors.grey),
                )
              ),
              child: Center(
                child: Text(value.toString()),
              ),
            )
          ),

          Expanded(
            child: Container(
              child: Center(child: Icon(Icons.add, size: 25,),),
            )
          ),


        ],
      ),
    );
  }
}