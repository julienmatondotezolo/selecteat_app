import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/controllers/navigation.dart';
import 'package:selecteat_app/utils/constants.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    NavigationController navigation =
          Provider.of<NavigationController>(context, listen: false);

    int _selectedIndex = navigation.screenIndex;

    final routes = [
        '/nearbyStores',
        '/scanner',
        '/home',
        '/favourites',
        '/profile',
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      navigation.changeScreen(_selectedIndex);
      Navigator.pushNamed(context, routes[index]);
    }

    // Future.delayed(Duration.zero, () {
    //   navigation.changeScreen(_selectedIndex);
    // });

    return BottomNavigationBarTheme(
      data: const BottomNavigationBarThemeData(
          unselectedItemColor: brandDarkColor,
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
            icon: Icon(Icons.favorite_border),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
