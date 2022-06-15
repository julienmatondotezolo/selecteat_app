import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selecteat_app/models/products.dart';
import 'package:selecteat_app/viewmodels/products_view_model.dart';

class FavouritesService {
  CollectionReference favouritesCollection =
      FirebaseFirestore.instance.collection('favourites');

  Future checkIfExistInFavourites(
      {required String uid, required ProductViewModel product}) async {
    final list = await favouritesCollection
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

  Future addToFavourites(
      {required String uid, required ProductViewModel product}) async {
    final list = favouritesCollection.doc();

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

  Future getFavourites({required String uid}) async {
    final list = await favouritesCollection.where('uid', isEqualTo: uid).get();

    try {
      Iterable result = list.docs.map((doc) => doc.data()).toList();
      return result.map((product) => Products.fromJson(product)).toList();
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future removeFromFavourites(
      {required String uid, required ProductViewModel product}) async {
    final list = await favouritesCollection
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

  Future clearFavourites({required String uid}) async {
    final list = favouritesCollection.where('uid', isEqualTo: uid).get();

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
