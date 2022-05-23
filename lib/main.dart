import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/screens/home_screen.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Select Eat App',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(displayColor: brandDarkColor)
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ProductsListViewModel(),
          ),
        ], 
        child: const HomeScreen()
      ),
    );
  }
}