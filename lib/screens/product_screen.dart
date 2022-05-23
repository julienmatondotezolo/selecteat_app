import 'package:cache_image/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/viewmodels/products_list_view_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<ProductsListViewModel>(context, listen: false).topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<ProductsListViewModel>(context);

    return Scaffold(
      appBar: AppBar(),
      // body: Text(listViewModel.productsList.length.toString()),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: listViewModel.productsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: Image(
              fit: BoxFit.cover,
              image: CacheImage(listViewModel.productsList[index].image_url)
            ), 
            // Image.network(listViewModel.productsList[index].image_url),
          );
        },
      ),
    );
  }
}
