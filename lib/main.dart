import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/controllers/favourites.dart';
import 'package:selecteat_app/controllers/list.dart';
import 'package:selecteat_app/controllers/local.dart';
import 'package:selecteat_app/controllers/navigation.dart';
import 'package:selecteat_app/controllers/selecteat.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/screens/favourites_screen.dart';
import 'package:selecteat_app/view/screens/home_screen.dart';
import 'package:selecteat_app/view/screens/list_screen.dart';
import 'package:selecteat_app/view/screens/nearby_stores_screen.dart';
import 'package:selecteat_app/view/screens/product_screen.dart';
import 'package:selecteat_app/view/screens/profile_screen.dart';
import 'package:selecteat_app/view/screens/scanner_screen.dart';
import 'package:selecteat_app/view/screens/search_screen.dart';
import 'package:selecteat_app/viewmodels/meals_list_view_model.dart';
import 'package:selecteat_app/viewmodels/nearby_stores_list_view_model.dart';
import 'package:selecteat_app/viewmodels/products_list_view_model.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:selecteat_app/viewmodels/search_list_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
        ListenableProvider<LocalController>(
          create: (_) => LocalController(),
        ),
        ListenableProvider<NavigationController>(
          create: (_) => NavigationController(),
        ),
        ListenableProvider<ListController>(
          create: (_) => ListController(),
        ),
        ListenableProvider<SelectEatController>(
          create: (_) => SelectEatController(),
        ),
        ListenableProvider<FavouritesController>(
          create: (_) => FavouritesController(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchListViewModel(),
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
    const FavouritesScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    Provider.of<UserProvider>(context, listen: false)
        .getCurrentUser(firebaseUser.uid);
    Provider.of<NavigationController>(context, listen: false);
    Provider.of<ListController>(context).getProductList(firebaseUser.uid);
    final localController = Provider.of<LocalController>(context);

    return MaterialApp(
      color: brandPrimaryColor,
      debugShowCheckedModeBanner: false,
      title: 'Select Eat App',
      themeMode: ThemeMode.system,
      // theme: MyThemes.lighTheme,
      theme: ThemeData(
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent),
        primaryColor: brandPrimaryColor,
        fontFamily: 'Montreal',
        textTheme:
            Theme.of(context).textTheme.apply(displayColor: brandDarkColor),
      ),
      initialRoute: '/home',
      locale: localController.locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fr'),
        Locale('nl'),
      ],
      routes: {
        '/home': (context) => const HomeScreen(),
        '/nearbyStores': (context) => const NearbyStoreScreen(),
        '/scanner': (context) => const ScannerScreen(),
        '/products': (context) => const ProductScreen(),
        '/meals': (context) => const ProductScreen(),
        '/search': (context) => const SearchScreen(),
        '/favourites': (context) => const FavouritesScreen(),
        '/list': (context) => const ListScreen(),
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
    return MaterialApp(title: "Registration", home: LoginScreen());
  }
}
