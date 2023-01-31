import '/pages/authorisation/login_page.dart';
import '/pages/authorisation/register.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLogin = true;

  void toggleState(){
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLogin) {
      return LoginPage(showRegisterPage: toggleState,);
    } else {
      return RegisterPage(showLoginPage:  toggleState,);
    }
  }
}
