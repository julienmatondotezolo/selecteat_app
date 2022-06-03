import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search products & meals...",
          icon: Icon(
            Icons.search,
            color: brandPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}