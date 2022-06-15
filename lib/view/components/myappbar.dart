import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/components/search_app_bar.dart';
import 'package:selecteat_app/view/widgets/search_bar.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(140);

  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image(
          image: Svg("assets/logo/logo-selecteat.svg"),
          // height: 200
          ),
      centerTitle: true,
      actions: [
        Container(
          child: Container(
            margin: EdgeInsets.only(right: 20),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 7),
                  child: Icon(Icons.shopping_cart_outlined)),
                Positioned(
                  right: 0,
                    top: 15,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: brandPrimaryColor, shape: BoxShape.circle),
                    child: Text(
                      "4",
                      style: const TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
      bottom: SearchAppBar(),
      toolbarHeight: 80,
      elevation: 0,
      foregroundColor: brandDarkColor,
      backgroundColor: brandLightGreyColor,
    );
  }
}
