import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/components/searchdelegate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.zero;
  
  const SearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
      child: GestureDetector(
        onTap: () {
            showSearch(
              context: context,
              delegate: MySearchDelegate(),
            );
          },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: brandPrimaryColor,
              ),
              SizedBox(width: 10,),
              Text(
              AppLocalizations.of(context)!.search,
              style: TextStyle(
                color: Colors.grey
              ),
              )
            ],
          )
        ),
      ),
    );
  }
}