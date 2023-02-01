import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {

  final user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Signed In as : ${user!.email!}"),
          SizedBox(height: 10,),
          MaterialButton(onPressed:() {
            FirebaseAuth.instance.signOut();
            },
            child: Text("Sign Out", style: TextStyle(color: Colors.white),),
            color: Colors.deepOrange,
          )
        ],),
    );
  }
}
