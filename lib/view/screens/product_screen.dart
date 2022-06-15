import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/components/bottomnav.dart';
import 'package:selecteat_app/view/widgets/products_grid.dart';
import 'package:selecteat_app/viewmodels/products_list_view_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final categories = [
    {
      'name': 'Fruits et legumes frais',
      'image': 'assets/icons/fruits.png',
    },
    {
      'name': 'Viande et poissons',
      'image': 'assets/icons/meatandfish.png',
    },
    {
      'name': 'Cremerie',
      'image': 'assets/icons/cremerie.png',
    },
    {
      'name': 'Boulangerie',
      'image': 'assets/icons/bread.png',
    },
    {
      'name': 'Epicerie-sucree',
      'image': 'assets/icons/sweets.png',
    },
    {
      'name': 'Surgeles',
      'image': 'assets/icons/frozen.png',
    },
    {
      'name': 'Boissons-et-alcools',
      'image': 'assets/icons/drinks.png',
    },
    {
      'name': 'Conserves',
      'image': 'assets/icons/cremerie.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<ProductsListViewModel>(context);

    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      body: Stack(
        children: [
          SafeArea(
              child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Products",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            var category = categories[index];
                            var name = category['name'];
                            var image = category['image'];

                            return Container(
                              width: 80,
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    foregroundDecoration: const BoxDecoration(
                                      color: Colors.black,
                                      backgroundBlendMode: BlendMode.saturation,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: brandLightGreyColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    padding: const EdgeInsets.all(15),
                                    child: Image(
                                      image: AssetImage(image!),
                                      height: 30,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    name!,
                                    softWrap: true,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductsGrid(productsList: listViewModel.productsList),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
