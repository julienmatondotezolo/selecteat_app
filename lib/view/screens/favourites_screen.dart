import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/auth/provider/user_provider.dart';
import 'package:selecteat_app/controllers/favourites.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/components/bottomnav.dart';
import 'package:selecteat_app/view/components/myappbar.dart';
import 'package:selecteat_app/view/widgets/favourites_item.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).currentUser;

    FavouritesController favouritesListController = Provider.of<FavouritesController>(context);
    favouritesListController.getFavouritesList(user!.uid);
    List<ProductViewModel> productsList = Provider.of<FavouritesController>(context).favouritesList;

    return Scaffold(
      appBar: MyAppBar(),
      bottomNavigationBar: const BottomNav(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Favourites",
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: const TextStyle(
                  color: brandDarkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            DefaultTabController(
              length: 2,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: brandPrimaryColor,
                      labelStyle: TextStyle(
                        color: brandDarkColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      unselectedLabelStyle: TextStyle(
                        color: brandDarkColor,
                        fontSize: 18,
                      ),
                      tabs: [
                        Tab(text: "Products"),
                        Tab(text: "Meals"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        SingleChildScrollView(child: FavouritesItem(productList: productsList,user: user)),
                        SingleChildScrollView(child: FavouritesItem(productList: productsList,user: user))
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
