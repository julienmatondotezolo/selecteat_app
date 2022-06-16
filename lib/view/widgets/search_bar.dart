import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/components/searchdelegate.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: GestureDetector(
          onTap: () {
            showSearch(
              context: context,
              delegate: MySearchDelegate(),
            );
          },
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: brandPrimaryColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Que recherchez-vous ?",
                style: TextStyle(color: Colors.grey),
              )
            ],
          )

          // const TextField(
          //   readOnly: true,
          //   decoration: InputDecoration(
          //     hintText: "Que recherchez-vous ?",
          //     icon: Icon(
          //       Icons.search,
          //       color: brandPrimaryColor,
          //     ),
          //     border: InputBorder.none,
          //   ),
          // ),
          ),
    );
  }
}
