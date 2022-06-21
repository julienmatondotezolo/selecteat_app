import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/auth/provider/user_provider.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/components/bottomnav.dart';
import 'package:selecteat_app/view/widgets/cart.dart';
import 'package:selecteat_app/view/widgets/cart_home.dart';
import 'package:selecteat_app/view/widgets/meals_slider.dart';
import 'package:selecteat_app/view/widgets/products_grid.dart';
import 'package:selecteat_app/view/widgets/search_bar.dart';
import 'package:selecteat_app/viewmodels/meals_list_view_model.dart';
import 'package:selecteat_app/viewmodels/products_list_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _allMeals(context) {
    Navigator.pushNamed(context, '/meals');
  }

  void _allProducts(context) {
    Navigator.pushNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var productListViewModel = Provider.of<ProductsListViewModel>(context);
    var mealListViewModel = Provider.of<MealsListViewModel>(context);
    var user = Provider.of<UserProvider>(context).currentUser;

    if (user == null) {
      return Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          margin: const EdgeInsets.all(40),
          child: const Center(
            child: CircularProgressIndicator(color: brandPrimaryColor),
          ),
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      body: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(height: size.height * .38, color: brandPrimaryLightColor),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Container(
                      //   alignment: Alignment.center,
                      //   height: 40,
                      //   width: 40,
                      //   decoration: const BoxDecoration(
                      //       color: Colors.white, shape: BoxShape.circle),
                      //   child: Text(
                      //     user.initials,
                      //     textAlign: TextAlign.center,
                      //     style: TextStyle(
                      //       // fontSize: 18,
                      //       fontWeight: FontWeight.bold,
                      //       color: brandPrimaryColor,
                      //     ),
                      //   ),
                      // ),
                      CartHome()
                    ],
                  ),
                  Text("${AppLocalizations.of(context)!.helloWorld}, ${user.firstname} !",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    "Explore new meals and select the best ingredients for you.",
                  ),
                  const SizedBox(height: 20),
                  const SearchBar(),
                ],
              ),
            ),
          ),
          Positioned(
            child: Container(
              height: size.height * .66,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Top meals this week",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            GestureDetector(
                              onTap: () => _allMeals(context),
                              child: const Text(
                                "see all",
                                style: TextStyle(
                                    fontSize: 12, color: brandPrimaryColor),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height / 4.5,
                          child: MealsSlider(
                              gridList: mealListViewModel.mealsList),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Products",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            GestureDetector(
                              onTap: () => _allProducts(context),
                              child: const Text(
                                "see all",
                                style: TextStyle(
                                    fontSize: 12, color: brandPrimaryColor),
                              ),
                            ),
                          ],
                        ),
                        ProductsGrid(
                          productsList: productListViewModel.productsList,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                side: const BorderSide(
                                    width: 2.0, color: brandDarkColor),
                                // backgroundColor: brandPrimaryColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                              ),
                              onPressed: () => _allProducts(context),
                              child: const Text(
                                'all products',
                                style: TextStyle(
                                  color: brandDarkColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height / 8,
                    )
                  ],
                ),
              ),
            ),
            top: size.height * .34,
          ),
        ],
      ),
    );
  }
}
