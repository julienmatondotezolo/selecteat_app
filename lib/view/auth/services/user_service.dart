import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selecteat_app/view/auth/services/authentication_service.dart';

class UserService {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  CollectionReference favouritesCollection =
      FirebaseFirestore.instance.collection('favourites');

  CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cart');

  // Future<String?> currentUser() async {
  //   String uid = _firebaseAuth.currentUser!.uid.toString();

  //   try {
  //     usersCollection.add({
  //       'uid': uid,
  //       'name': name,
  //       'firstname': firstname,
  //       'email': email,
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     print(e.message);
  //     return e.message;
  //   }
  // }

}
