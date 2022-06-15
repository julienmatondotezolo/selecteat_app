import 'package:flutter/material.dart';
import 'package:selecteat_app/auth/services/user_service.dart';
import 'package:selecteat_app/models/users.dart';
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
    }

    if (currentUser != null) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
