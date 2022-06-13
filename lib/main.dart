import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/controllers/navigation.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/screens/home_screen.dart';
import 'package:selecteat_app/view/screens/nearby_stores_screen.dart';
import 'package:selecteat_app/view/screens/product_screen.dart';
import 'package:selecteat_app/view/screens/profile_screen.dart';
import 'package:selecteat_app/view/screens/scanner_screen.dart';
import 'package:selecteat_app/viewmodels/meals_list_view_model.dart';
import 'package:selecteat_app/viewmodels/nearby_stores_list_view_model.dart';
import 'package:selecteat_app/viewmodels/products_list_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<NavigationController>(
          create: (_) => NavigationController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductsListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => MealsListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => NearbyStoresListViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final screens = [
    const NearbyStoreScreen(),
    const ScannerScreen(),
    const HomeScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    NavigationController navigation =
        Provider.of<NavigationController>(context, listen: true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Select Eat App',
      theme: ThemeData(
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent),
        primaryColor: brandPrimaryColor,
        textTheme:
            Theme.of(context).textTheme.apply(displayColor: brandDarkColor),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/nearbyStores': (context) => const NearbyStoreScreen(),
        '/scanner': (context) => const ScannerScreen(),
        '/products': (context) => const ProductScreen(),
        '/meals': (context) => const ProductScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
      // home: Navigator(
      //     pages: const [
      //       // MaterialPage(child: screens[navigation.screenIndex]),
      //       if (navigation.screenIndex == 0) MaterialPage(child: screens[0]),
      //       if (navigation.screenIndex == 1) MaterialPage(child: screens[1]),
      //       if (navigation.screenIndex == 2) MaterialPage(child: screens[2]),
      //       if (navigation.screenIndex == 3) MaterialPage(child: screens[3]),
      //     ],
      //     onPopPage: (route, result) {
      //       return route.didPop(result);
      //     }),
    );
  }
}
