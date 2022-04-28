import 'package:flutter/material.dart';

class CustomNumberPicker extends StatefulWidget {

  final Function(int) onUpdate;
  final int initialValue;
  
  const CustomNumberPicker({
    Key? key,
    required this.onUpdate,
    required this.initialValue
  }) : super(key: key);

  @override
  State<CustomNumberPicker> createState() => _CustomNumberPickerState();
}

class _CustomNumberPickerState extends State<CustomNumberPicker> {

  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [

          // * Quantity
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey)
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    _currentValue.toString(),
                  ),
                ),
              ),
            )
          ),

          // remove
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ElevatedButton(
                child: const  Padding(
                  padding: EdgeInsets.all(5), 
                  child: Icon(Icons.remove)
                ),
                onPressed: (){
                  setState(() {
                    _currentValue -= 1;
                    if (_currentValue<=1) _currentValue = 1;
                    widget.onUpdate(_currentValue);
                  });
                },
              ),
            ),
          ),
          
          // add
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ElevatedButton(
                child: const  Padding(
                  padding: EdgeInsets.all(5), 
                  child: Icon(Icons.add)
                ),
                onPressed: (){
                  setState(() {
                    _currentValue += 1;
                    if (_currentValue<=1) _currentValue = 1;
                    widget.onUpdate(_currentValue);
                  });
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}