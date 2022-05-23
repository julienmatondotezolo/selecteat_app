import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/screens/product_screen.dart';
import 'package:selecteat_app/viewmodels/products_list_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Select Eat App',
      theme: ThemeData(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ProductsListViewModel(),
          ),
        ], 
        child: const ProductScreen()
      ),
    );
  }
}