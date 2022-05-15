import 'package:firebase_auth/firebase_auth.dart';
import 'package:ics324project/classes/user.dart';

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
      print(e.toString());
      return null;
    }
  }
}
