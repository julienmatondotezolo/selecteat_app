import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/widgets/search_bar.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var listViewModel = Provider.of<ProductsListViewModel>(context); 

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * .35,
            color: brandPrimaryLightColor
          ),
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
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
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
                  Text(
                    "Welcome Back, Julien !", 
                    style: Theme.of(context)
                      .textTheme.headline5!
                      .copyWith(fontWeight: FontWeight.bold)
                  ),
                  const Text(
                    "Explore new meals and select the best ingredients for you.",
                  ),
                  const SizedBox(height: 20),
                  const search_bar()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
