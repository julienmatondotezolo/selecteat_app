import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/auth/provider/user_provider.dart';
import 'package:selecteat_app/auth/services/authentication_service.dart';
import 'package:selecteat_app/controllers/local.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/components/bottomnav.dart';
import 'package:selecteat_app/view/components/myappbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedValue = "fr";
  bool _lights = false;
  var localController;

  @override
  void initState() {
    localController = Provider.of<LocalController>(context, listen: false);
    super.initState();
  }

  void _signOut() async {
    context.read<AuthenticationService>().signOut();
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
        DropdownMenuItem(
          onTap: () => localController.setLocale(Locale("fr")),
          child: Text("Français"),
          value: "fr"),
        DropdownMenuItem(
          onTap: () => localController.setLocale(Locale("nl")),
          child: Text("Nederlands"),
          value: "nl"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final firebaseUser = context.watch<User>();
    var user = Provider.of<UserProvider>(context).currentUser;

    return Scaffold(
        appBar: MyAppBar(),
        bottomNavigationBar: const BottomNav(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height / 40),
                      Text(AppLocalizations.of(context)!.profilePage,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height / 40),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: brandPrimaryOpaqueColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 10),
                                ]),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.person,
                                  color: brandDarkColor,
                                  size: 24,
                                ),
                                SizedBox(width: size.width / 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("${user!.firstname} ${user.name}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontWeight: FontWeight.w500)),
                                      Text(
                                        user.email,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.edit_outlined,
                                  color: brandDarkColor,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: size.height / 30),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: brandPrimaryOpaqueColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 10),
                                ]),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.lock,
                                  color: brandDarkColor,
                                  size: 24,
                                ),
                                SizedBox(width: size.width / 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(AppLocalizations.of(context)!.editPassword,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontWeight:
                                                      FontWeight.normal)),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.edit_outlined,
                                  color: brandDarkColor,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: size.height / 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.language,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontWeight: FontWeight.w500)),
                              SizedBox(width: size.width / 20),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      color: brandPrimaryOpaqueColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.05),
                                            blurRadius: 10),
                                      ]),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            value: selectedValue,
                                            style: const TextStyle(
                                                color: brandDarkColor,
                                                fontSize: 20),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedValue = newValue!;
                                              });
                                            },
                                            items: dropdownItems),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height / 30),
                          // SwitchListTile(
                          //     value: _lights,
                          //     activeColor: brandPrimaryColor,
                          //     contentPadding: EdgeInsets.zero,
                          //     onChanged: (bool value) {
                          //       setState(() {
                          //         _lights = value;
                          //       });
                          //     },
                          //     secondary: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Text("Dark Mode",
                          //             style: Theme.of(context)
                          //                 .textTheme
                          //                 .headline6!
                          //                 .copyWith(
                          //                     fontWeight: FontWeight.w500)),
                          //       ],
                          //     )),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  primary: brandRedNotifyColor,
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 2.0,
                                          color: brandRedNotifyColor),
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 15)),
                              onPressed: _signOut,
                              child: Text(
                                AppLocalizations.of(context)!.logout,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
