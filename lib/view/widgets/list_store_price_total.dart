import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ListStorePriceTotal extends StatelessWidget {
  const ListStorePriceTotal({
    Key? key,
    required this.store,
    required this.totalPrice,
  }) : super(key: key);

  final store;
  final totalPrice;

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
            text: TextSpan(
              children: [
              TextSpan(
                text: AppLocalizations.of(context)!.itemsToPick,
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
            text: TextSpan(children: [
              TextSpan(
                text: AppLocalizations.of(context)!.total,
                style: TextStyle(
                  color: brandDarkColor,
                ),
              ),
              TextSpan(
                text: "€ $totalPrice",
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
