import 'package:flutter/material.dart';

class CartImage extends StatelessWidget {
  final Future<String> imgUrl;
  const CartImage({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: imgUrl,
      builder: (context, snapshot) {

        if(!snapshot.hasError) {
          if(snapshot.connectionState==ConnectionState.done) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(snapshot.data!, fit: BoxFit.cover,)
            );
          }
        }

        return const Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    );
  }
}