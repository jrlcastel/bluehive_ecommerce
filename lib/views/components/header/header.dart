import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  final String name;
  final EdgeInsets margin;
  
  const Header({
    Key? key,
    required this.name,
    this.margin = const EdgeInsets.fromLTRB(15, 30, 15, 0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: margin,
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

  }

}