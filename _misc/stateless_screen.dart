import 'package:flutter/material.dart';

class StatelessScreen extends StatelessWidget {
  const StatelessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: SafeArea(
        child: Container(
          // ! remove this after successful test run
          color: Colors.black,
          height: double.infinity,
          width: double.infinity,
          child: null,
        ),
      ),
    );
  }
}