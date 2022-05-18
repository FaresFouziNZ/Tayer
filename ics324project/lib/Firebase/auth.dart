import 'package:firebase_auth/firebase_auth.dart';
import 'package:ics324project/Firebase/database.dart';
import 'package:ics324project/classes/prog_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ProgUser _userFromFireBaseUser(User user) {
    return user != null ? ProgUser(uid: user.uid) : null;
  }

  Stream<ProgUser> get user {
    return _auth.authStateChanges().map(_userFromFireBaseUser);
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result =
          await _auth.createUserWithEmailAndPassword(email: email, password: password).then((result) async {
        await DatabaseService().createUser(user: ProgUser(uid: result.user.uid));
        return null;
      });
      User user = result?.user;

      return _userFromFireBaseUser(user);
    } catch (e) {
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
