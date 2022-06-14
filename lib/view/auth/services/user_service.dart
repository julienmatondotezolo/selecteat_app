import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selecteat_app/models/users.dart';
import 'package:selecteat_app/view/auth/services/authentication_service.dart';

class UserService {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  CollectionReference favouritesCollection =
      FirebaseFirestore.instance.collection('favourites');

  CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cart');

  Future<UserModel?> getUserData({required String uid}) async {
    UserModel userModel;
    var value = await usersCollection.doc(uid).get();

    if (value.exists == false) {
      return userModel = UserModel(
        email: value.get("email"),
        firstname: value.get("firstname"),
        name: value.get("name"),
        uid: value.get("uid"),
      );
    }
  }
}
