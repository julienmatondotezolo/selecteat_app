import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/controllers/favourites.dart';
import 'package:selecteat_app/controllers/list.dart';
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
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'auth/provider/user_provider.dart';
import 'auth/screens/login.dart';
import 'auth/services/authentication_service.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  // FlutterNativeSplash.remove();
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,
        ),
        ListenableProvider<NavigationController>(
          create: (_) => NavigationController(),
        ),
        ListenableProvider<ListController>(
          create: (_) => ListController(),
        ),
        ListenableProvider<FavouritesController>(
          create: (_) => FavouritesController(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
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
      child: AuthenticationWrapper(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductsListViewModel>(context, listen: false).allProducts();
    Provider.of<MealsListViewModel>(context, listen: false).allMeals();
  }

  final screens = [
    const NearbyStoreScreen(),
    const ScannerScreen(),
    const HomeScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    Provider.of<UserProvider>(context, listen: false).getCurrentUser(firebaseUser.uid);

    NavigationController navigation =
        Provider.of<NavigationController>(context, listen: false);

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
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) return const MyApp();
    return MaterialApp(
      title: "Registration",
      home: LoginScreen()
    );
  }
}
