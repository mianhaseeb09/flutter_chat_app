import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/helper/helper_function.dart';
import 'package:flutter_chat_app/services/database.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // login
  Future loginWithUserNameandPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        // call our database service to update user data

        return true;
      } else {}
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // register

  Future registerUserWithEmailandPassword(
      String fullname, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        // call our database service to update user data

        await DatabaseService(uid: user.uid).savingUserData(fullname, email);
        return true;
      } else {}
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // sign out
  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailStatus("");
      await HelperFunctions.saveUserNameStatus("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
