import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/viewmodels/nearbyStores_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NearbyStoresList extends StatelessWidget {
  final List<NearbyStoresViewModel> nearbyStoresList;

  const NearbyStoresList({
    Key? key,
    required this.nearbyStoresList,
  }) : super(key: key);

  void _focusStoreOnMap(NearbyStoresViewModel nearbyStores, context) async {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text(nearbyStores.properties["commercialName"]),
      content: Column(
        children: [
          Text(nearbyStores.street)
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Go back"),
        ),
      ],
    ));
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: nearbyStoresList.length,
      itemBuilder: (context, index) {
        var nearbyStores = nearbyStoresList[index];

        return Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          height: size.height / 8,
          decoration: BoxDecoration(
              color: brandLightGreyColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nearbyStores.properties["commercialName"].length > 28
                        ? nearbyStores.properties["commercialName"]
                                .substring(0, 28) +
                            '...'
                        : nearbyStores.properties["commercialName"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(nearbyStores.street.length > 30
                      ? nearbyStores.street.substring(0, 30) + '...'
                      : nearbyStores.street),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.distance,
                        style: TextStyle(
                          color: brandDarkColor,
                        ),
                      ),
                      TextSpan(
                        // text: nearbyStores.properties["distance"].toString(),
                        text: nearbyStores.distance,
                        style: const TextStyle(
                          color: brandDarkColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
              TextButton(
                onPressed: () => _focusStoreOnMap(nearbyStores, context),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                style: TextButton.styleFrom(
                  backgroundColor: brandPrimaryColor,
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(38, 38),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
