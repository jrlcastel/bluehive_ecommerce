import 'package:flutter/material.dart';

class CustomNumberPicker extends StatelessWidget {

  final int value;
  final Function(int, int) onUpdate;
  final Function onDelete;

  const CustomNumberPicker({
    Key? key,
    required this.value,
    required this.onUpdate,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1)
      ),
      child: Row(
        children: [


          Expanded(
            child: GestureDetector(
              onTap: () {
                onUpdate(value,value-1);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Center(
                  child: Icon(
                    Icons.remove,
                    size: 25
                  )
                )
              ),
            )
          ),
          
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
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
            child: GestureDetector(
              onTap: () {
                onUpdate(value,value+1);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 25
                  )
                )
              ),
            )
          ),


        ],
      ),
    );
  }
}