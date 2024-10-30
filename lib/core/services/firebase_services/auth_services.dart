import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_package/flutter_package.dart';

class AuthServices {
  static AuthServices? _instance;

  AuthServices._internal() {
    _instance = this;
  }

  factory AuthServices() => _instance ?? AuthServices._internal();

  Future<UserCredential?> firebaseCreateAccount(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        LogUtility.writeLog('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        LogUtility.writeLog('The account already exists for that email.');
      }
      rethrow;
    } catch (e) {
      LogUtility.writeLog(e);
      rethrow;
    }
  }

  Future<UserCredential?> firebaseLoginAccount(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        LogUtility.writeLog('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        LogUtility.writeLog('Wrong password provided for that user.');
      }
      rethrow;
    } catch (e) {
      LogUtility.writeLog(e);
      rethrow;
    }
  }

  Future firebaseLogout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      LogUtility.writeLog(e);
    }
  }
}
