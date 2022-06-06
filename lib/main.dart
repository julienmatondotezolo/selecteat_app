import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final screens = [
    const NearbyStoreScreen(),
    const ScannerScreen(),
    const HomeScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      home: MultiProvider(
          providers: [
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
          // child: const HomeScreen()
          child: Scaffold(
            body: screens[_selectedIndex],
            bottomNavigationBar: BottomNavigationBarTheme(
              data: const BottomNavigationBarThemeData(
                  selectedItemColor: brandPrimaryColor),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.room_outlined),
                    label: 'Map',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.qr_code_2),
                    label: 'Scan',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
