import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/widgets/select_eat_stores.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  void _balanced(context, ingredients) async {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return SelectEatStores(ingredients: ingredients);
        });
  }

  void _ecologic(context, ingredients) async {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return SelectEatStores(ingredients: ingredients);
        });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Shopping list",
          ),
          toolbarHeight: 80,
          elevation: 0,
          foregroundColor: brandDarkColor,
          backgroundColor: brandLightGreyColor,
        ),
        body: SafeArea(
          child: Column(
            children: const [],
          ),
        ));
  }
}
