import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';

class ListStorePriceTotal extends StatelessWidget {
  const ListStorePriceTotal({
    Key? key,
    required this.store,
  }) : super(key: key);

  final store;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 2.0, color: brandLightGreyColor),
          bottom: BorderSide(width: 2.0, color: brandLightGreyColor),
        ),
        color: brandPrimaryOpaqueColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(children: [
              const TextSpan(
                text: "Items to pick at ",
                style: TextStyle(
                  color: brandDarkColor,
                ),
              ),
              TextSpan(
                text: store,
                style: const TextStyle(
                  color: brandDarkColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
          RichText(
            text: const TextSpan(children: [
              TextSpan(
                text: "Total: ",
                style: TextStyle(
                  color: brandDarkColor,
                ),
              ),
              TextSpan(
                text: "€ 4,45",
                style: TextStyle(
                  color: brandDarkColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
