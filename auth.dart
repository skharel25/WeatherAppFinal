import 'package:firebase_auth/firebase_auth.dart';
import 'package:messageboard/data/EndUser.dart';

class AuthenticationService {
  FirebaseAuth auth = FirebaseAuth.instance;

  // Custom User based on UserCredential
  EndUser? _userfromFirebase(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? EndUser(uid: user.uid, name: user.displayName) : null;
  }

  // Changes user stream

  Stream<EndUser?> get user {
    return auth.authStateChanges().map(_userfromFirebase);
  }

  // Anonymous Sign in Method

  Future anonymousSignIn() async {
    try {
      UserCredential result = await auth.signInAnonymously();
      User user = result.user;
      return _userfromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmail(String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userfromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userfromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
