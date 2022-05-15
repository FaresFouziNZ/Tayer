import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:ics324project/Firebase/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  Duration get loginTime => const Duration(milliseconds: 2250);
  Future<String> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      logo: 'image/logo.png',
      onLogin: _authUser,
      onRecoverPassword: _recoverPassword,
      loginAfterSignUp: true,
      hideForgotPasswordButton: true,
      theme: LoginTheme(primaryColor: Colors.deepPurpleAccent),
      // onSubmitAnimationCompleted: ,
    );
  }
}
