import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/components/myappbar.dart';
import 'package:selecteat_app/view/widgets/select_eat_stores.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SelectEatScreen extends StatelessWidget {
  final dynamic meal;
  const SelectEatScreen({Key? key, required this.meal}) : super(key: key);

  void _balanced(context, ingredients) async {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return SelectEatStores(ingredients: ingredients, option: "balanced");
        });
  }

  void _economic(context, ingredients) async {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return SelectEatStores(ingredients: ingredients, option: "economic");
        });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: MyAppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!.selectEat1,
                          style: const TextStyle(
                            color: brandDarkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: meal.title,
                          style: const TextStyle(
                            color: brandPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context)!.selectEat2,
                          style: const TextStyle(
                            color: brandDarkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                ),
                const SizedBox(
                  height: 40,
                ),
                DefaultTextStyle(
                  style: const TextStyle(color: Colors.white),
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: const BoxDecoration(
                          color: brandPrimaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 10),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width / 1.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Balanced',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.balanced,
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.balanced1,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.balanced2,
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.balanced3,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]
                                  )
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.balanced5,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.balanced6,
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.balanced7,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.balanced8,
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.balanced9,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.balanced10,
                                      ),
                                    ]
                                  )
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () => _balanced(context, meal.ingredients),
                            child: const Icon(
                              Icons.arrow_forward_rounded,
                              color: brandPrimaryColor,
                              size: 20,
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(38, 38),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ),

                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: const BoxDecoration(
                      color: brandPrimaryOpaqueColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width / 1.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Economic',
                              style: TextStyle(
                                color: brandDarkColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.economic,
                                        style: const TextStyle(
                                          color: brandDarkColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.economic1,
                                        style: const TextStyle(
                                          color: brandDarkColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.economic2,
                                        style: const TextStyle(
                                          color: brandDarkColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.economic3,
                                        style: const TextStyle(
                                          color: brandDarkColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]
                                  )
                                ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.economic5,
                                        style: const TextStyle(
                                          color: brandDarkColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.economic6,
                                        style: const TextStyle(
                                          color: brandDarkColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.economic7,
                                        style: const TextStyle(
                                          color: brandDarkColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.economic8,
                                        style: const TextStyle(
                                          color: brandDarkColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.economic9,
                                        style: const TextStyle(
                                          color: brandDarkColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.economic10,
                                        style: const TextStyle(
                                          color: brandDarkColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]
                                  )
                                ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () => _economic(context, meal.ingredients),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: brandPrimaryColor,
                          padding: EdgeInsets.zero,
                          minimumSize: Size(38, 38),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
