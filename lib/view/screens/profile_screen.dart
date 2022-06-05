import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text("English"), value: "English"),
    const DropdownMenuItem(child: Text("Français"), value: "Français"),
    const DropdownMenuItem(child: Text("Nederlands"), value: "Nederlands"),
  ];
  return menuItems;
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedValue = "English";
  bool _lights = false;

  void _signOut() async {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text("Profile",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height / 20),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("John Doe",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(fontWeight: FontWeight.w500)),
                                  const Text(
                                    "johndoe@gmail.com",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const Text(
                                    "+32 (0) 49 876 54 32",
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
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Edit password",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(fontWeight: FontWeight.normal)),
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
                          Text("Language",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontWeight: FontWeight.w500)),
                          SizedBox(width: size.width / 20),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        value: selectedValue,
                                        style: const TextStyle(
                                            color: brandDarkColor, fontSize: 20),
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
                      SwitchListTile(
                          value: _lights,
                          activeColor: brandPrimaryColor,
                          contentPadding: EdgeInsets.zero,
                          onChanged: (bool value) {
                            setState(() {
                              _lights = value;
                            });
                          },
                          secondary: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Dark Mode",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontWeight: FontWeight.w500)),
                            ],
                          )),
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
                                      width: 2.0, color: brandRedNotifyColor),
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15)),
                          onPressed: _signOut,
                          child: const Text(
                            'Sign out',
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
