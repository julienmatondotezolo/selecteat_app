import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selecteat_app/models/products.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

class ListService {
  CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cart');

  Future checkIfExistInList(
      {required String uid, required ProductViewModel product}) async {
    final list = await cartCollection
        .where('uid', isEqualTo: uid)
        .where('storeproductid', isEqualTo: product.storeproductid)
        .get();
    try {
      // List<QueryDocumentSnapshot> productList =
      //     await list.then((snapshot) => snapshot.docs);

      List<QueryDocumentSnapshot> productList = list.docs;

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
    body.addAll({'uid': uid, 'quantity': 1});
    print(body);

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
    final list = await cartCollection.where('uid', isEqualTo: uid).get();

    try {
      Iterable result = list.docs.map((doc) => doc.data()).toList();
      return result.map((product) => Products.fromJson(product)).toList();
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future updateList(
      {required String uid,
      required ProductViewModel product,
      required int count}) async {
    final list = await cartCollection
        .where('uid', isEqualTo: uid)
        .where('storeproductid', isEqualTo: product.storeproductid)
        .get();

    try {
      list.docs.forEach((doc) {
        doc.reference.update({'quantity': count});
      });
      print("${product.name} is updated.");
      // print("${product.name} is updated.");
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future removeFromList(
      {required String uid, required ProductViewModel product}) async {
    final list = await cartCollection
        .where('uid', isEqualTo: uid)
        .where('storeproductid', isEqualTo: product.storeproductid)
        .get();

    try {
      list.docs.forEach((doc) {
        doc.reference.delete();
      });

      print("${product.name} is removed from list.");
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future clearList({required String uid}) async {
    final list = cartCollection.where('uid', isEqualTo: uid).get();

    try {
      list.then((value) => value.docs.forEach((doc) {
            doc.reference.delete();
          }));

      print("Product list is cleared.");
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }
}
