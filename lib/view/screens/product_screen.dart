import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/view/widgets/products_grid.dart';
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
      body: ProductsGrid(productsList: listViewModel.productsList,)
    );
  }
}
