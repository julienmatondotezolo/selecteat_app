import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';

class SelectEatStores extends StatefulWidget {
  const SelectEatStores({Key? key, required this.ingredients}) : super(key: key);

  final dynamic ingredients;

  @override
  State<SelectEatStores> createState() => _SelectEatStoresState();
}


class _SelectEatStoresState extends State<SelectEatStores> {
  void _addProductToList() async {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10),
          ]),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: size.height / 40,),
            SizedBox(height: size.height / 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                            style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: brandPrimaryColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15)
                            ),
                    onPressed: _addProductToList,
                    child: const Text(
                      'Select balanced ingredients in multiple stores',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}