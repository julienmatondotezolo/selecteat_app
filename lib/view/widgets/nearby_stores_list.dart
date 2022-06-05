import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/viewmodels/nearbyStores_view_model.dart';

class NearbyStoresList extends StatelessWidget {
  final List<NearbyStoresViewModel> nearbyStoresList;

  const NearbyStoresList({
    Key? key,
    required this.nearbyStoresList,
  }) : super(key: key);

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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nearbyStores.properties["commercialName"].length > 30
                                ? nearbyStores.properties["commercialName"].substring(0, 30) + '...'
                                : nearbyStores.properties["commercialName"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("Av. Marius Renard 21, 1070 Anderlecht"),
                  RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        text: "Distance: ",
                        style: TextStyle(
                          color: brandDarkColor,
                        ),
                      ),
                      TextSpan(
                        text: nearbyStores.properties["distance"].toString(),
                        style: const TextStyle(
                          color: brandDarkColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
              const TextButton(
                onPressed: null,
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: brandPrimaryColor,
                  size: 20,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
