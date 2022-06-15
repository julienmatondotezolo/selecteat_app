import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  /// Changed to idTokenChanges as it updates depending on more cases.
  // Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();
  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  /// This won't pop routes so you could do something like
  /// Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  /// after you called this method if you want to pop all routes.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      print("Resetting: $email");
      return "Resetting: $email";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String?> login(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String?> register(
      {required String email,
      required String password,
      required String name,
      required String firstname}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      await userSetup(email: email, name: name, firstname: firstname);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future<String?> userSetup(
      {required String name,
      required String firstname,
      required String email}) async {
    String uid = _firebaseAuth.currentUser!.uid.toString();

    try {
      usersCollection.doc(uid).set({
        'uid': uid,
        'name': name,
        'firstname': firstname,
        'email': email,
      });
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }
}
