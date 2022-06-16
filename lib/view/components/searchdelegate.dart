import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/viewmodels/search_list_view_model.dart';

class MySearchDelegate extends SearchDelegate {
  List<dynamic> searchTerms = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    if (searchTerms.isEmpty) {
      return Container(
        margin: const EdgeInsets.all(40),
        child: const Center(
          child: CircularProgressIndicator(
            color: brandPrimaryColor
          ),
        ),
      );
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Provider.of<SearchListViewModel>(context).searchSuggestion(query);
    searchTerms = Provider.of<SearchListViewModel>(context).searchListSuggestion;

    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    if (searchTerms.isEmpty && query.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.only(bottom: 200),
        child: const Center(
          child: CircularProgressIndicator(
            color: brandPrimaryColor
          ),
        ),
      );
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}