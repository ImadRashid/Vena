// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:detox/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import './database.dart';
import '../models/user.dart';
import './database.dart';

class AuthService {
  //user custom model
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null
        ? User(
            uid: user.uid,
            // firstLogIn:
          )
        : null;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get user {
    return _auth.onAuthStateChanged
        // .map((FirebaseUser user)=> _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //sign email pass
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      ///This will create the dummy initial data for each user in firestore which we can Update Later on
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid)
          .setUserData('John Doe', '1234567890', 'XYZ ZIP', true);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
