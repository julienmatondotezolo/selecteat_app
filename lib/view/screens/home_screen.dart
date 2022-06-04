import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/widgets/meals_slider.dart';
import 'package:selecteat_app/view/widgets/products_grid.dart';
import 'package:selecteat_app/view/widgets/search_bar.dart';
import 'package:selecteat_app/viewmodels/meals_list_view_model.dart';
import 'package:selecteat_app/viewmodels/products_list_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  void initState() {
    super.initState();
    Provider.of<ProductsListViewModel>(context, listen: false).allProducts();
    Provider.of<MealsListViewModel>(context, listen: false).allMeals();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var productListViewModel = Provider.of<ProductsListViewModel>(context);
    var mealListViewModel = Provider.of<MealsListViewModel>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(height: size.height * .38, color: brandPrimaryLightColor),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Text(
                        "JM",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          // fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: brandPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  Text("Welcome Back, Julien !",
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
                            const Text(
                              "see all",
                              style: TextStyle(
                                  fontSize: 12, color: brandPrimaryColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: size.height / 4.5,
                          child: MealsSlider(
                            gridList: mealListViewModel.mealsList
                          ),
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
                            const Text(
                              "see all",
                              style: TextStyle(
                                  fontSize: 12, color: brandPrimaryColor),
                            ),
                          ],
                        ),
                        ProductsGrid(
                          productsList: productListViewModel.productsList,
                        ),
                      ],
                    ),
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
