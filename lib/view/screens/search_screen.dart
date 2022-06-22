import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/components/bottomnav.dart';
import 'package:selecteat_app/view/components/myappbar.dart';
import 'package:selecteat_app/view/widgets/products_grid.dart';
import 'package:selecteat_app/viewmodels/products_list_view_model.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';
import 'package:selecteat_app/viewmodels/search_list_view_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var query;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        query = ModalRoute.of(context)!.settings.arguments;
      });
      Provider.of<SearchListViewModel>(context, listen: false)
        .searchResult(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ProductViewModel> searchListResult =
        Provider.of<SearchListViewModel>(context).searchListResult;
    var size = MediaQuery.of(context).size;

    var listViewModel = Provider.of<ProductsListViewModel>(context);

    return Scaffold(
      appBar: MyAppBar(),
      bottomNavigationBar: const BottomNav(),
      body: Stack(
        children: [
          SafeArea(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: size.width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Products",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Search result: "$query" (${searchListResult.length})'),
                        ProductsGrid(productsList: searchListResult),
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
