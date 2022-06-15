import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:selecteat_app/models/meals.dart';
import 'package:selecteat_app/models/users.dart';
import 'package:selecteat_app/services/meals_service.dart';
import 'package:selecteat_app/view/auth/services/user_service.dart';
import 'package:selecteat_app/viewmodels/meals_view_model.dart';
import 'package:selecteat_app/viewmodels/user_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class UserProvider with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  UserViewModel? currentUser;

  void getCurrentUser(uid) async {
    UserModel? user = await UserService().getUserData(uid: uid);
    notifyListeners();

    if (user != null) {
      currentUser = UserViewModel(user: user);
    } else {
      currentUser = "" as UserViewModel?;
    }

    if (currentUser != null) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
