import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Profile",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: brandPrimaryOpaqueColor,
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
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
                            Text("Profile",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontWeight: FontWeight.bold)),
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
                        size: 24,
                      ),
                    ],
                  ),
                ),
                                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: brandPrimaryOpaqueColor,
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
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
                                    .headline6!),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.edit_outlined,
                        color: brandDarkColor,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
