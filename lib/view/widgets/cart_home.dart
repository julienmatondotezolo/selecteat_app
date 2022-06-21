import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/controllers/list.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

class CartHome extends StatelessWidget {
  const CartHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductViewModel> productsList =
        Provider.of<ListController>(context).productsList;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, '/list');
          },
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              margin: EdgeInsets.only(right: 7),
              child: Icon(Icons.shopping_cart_outlined)),
        ),
        productsList.length > 0 ?
        Positioned(
          right: 0,
          bottom: 15,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                color: brandPrimaryColor, shape: BoxShape.circle),
            child: Text(
              productsList.length.toString(),
              style: const TextStyle(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
        ) : SizedBox()
      ],
    );
  }
}