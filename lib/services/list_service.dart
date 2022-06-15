import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

class ListService {
  CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cart');

  Future checkIfExistInList(
      {required String uid, required ProductViewModel product}) async {
    final list = cartCollection
        .where('uid', isEqualTo: uid)
        .where('storeproductid', isEqualTo: product.storeproductid)
        .get();
    try {
      List<QueryDocumentSnapshot> productList =
          await list.then((snapshot) => snapshot.docs);

      return productList.isNotEmpty;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future addToList(
      {required String uid, required ProductViewModel product}) async {
    final list = cartCollection.doc();

    final body = product.toJson();
    body.addAll({'uid': uid});

    try {
      await list.set(body);
      print("Succesfully added ${product.name} to list");
      return "Succesfully added ${product.name} to list";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future getList({required String uid}) async {
    final list = cartCollection..where('uid', isEqualTo: uid);

    try {
      await list.get();
      print("User list");
      return "User list";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future removeFromList(
      {required String uid, required ProductViewModel product}) async {
    final list = cartCollection
        .where('uid', isEqualTo: uid)
        .where('storeproductid', isEqualTo: product.storeproductid)
        .get();

    try {
      list.then((value) => value.docs.forEach((doc) {
            doc.reference.delete();
          }));

      print("${product.name} is removed from list.");
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  // Future<List<Products>> getList({required String uid}) async {
  //   DocumentSnapshot<Object?> list = await cartCollection.doc(uid).get();

  // }

}
