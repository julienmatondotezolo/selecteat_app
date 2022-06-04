import 'package:flutter/material.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

class ProductDetail extends StatelessWidget {
  final dynamic productList;

  const ProductDetail({Key? key, required this.productList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.amber,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(productList.name),
            ElevatedButton(
              child: const Text('Close BottomSheet'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
