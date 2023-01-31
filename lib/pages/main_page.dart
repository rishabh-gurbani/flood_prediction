import 'package:firebase_auth/firebase_auth.dart';
import 'package:flood_prediction_app/pages/app/home_page.dart';
import 'package:flutter/material.dart';
import '/pages/authorisation/auth_page.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>
        (stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return Home();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
