import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/utils/input_field.dart';
import '/utils/submit_button.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  final VoidCallback showLoginPage;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var primary = const TextStyle(fontWeight: FontWeight.bold, fontSize: 40);
  var secondary = const TextStyle(fontWeight:FontWeight.w400 ,fontSize: 25,);

  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _repPassController = TextEditingController();

  bool passwordMatch = true;

  void checkPasswords(string){
    setState(() {
      passwordMatch = (_passController.text == _repPassController.text);
    });
  }

  Future signUp() async{
    if(_passController.text.trim() == _repPassController.text.trim()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Icon(Icons.waving_hand_sharp, size: 40,),

                const SizedBox(height: 10,),

                Text("Get Started", style: primary,),

                const SizedBox(height: 10,),

                Text("Register here", style: secondary,),

                const SizedBox(height: 30,),

                InputField(prompt: "Enter Email ID",
                    isPassword: false,
                    controller : _emailController, onChanged: (string){},),

                InputField(prompt: "Enter Password",
                    isPassword: true,
                    controller : _passController, onChanged: (string){}),

                InputField(prompt: "Enter Password Again",
                    isPassword: true,
                    controller : _repPassController, onChanged:checkPasswords),

                Column(
                  children: <Widget>[
                    if (!passwordMatch) const SizedBox(height: 5,),
                    if (!passwordMatch) const Text("Passwords don't match",
                      style: TextStyle(color: Colors.red),),
                    if (!passwordMatch) const SizedBox(height: 5,),
                  ],
                ),

                SubmitButton(string: "Sign Up", action:signUp),

                const SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already Registered?", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black87, fontSize: 14)),
                    const SizedBox(width: 4,),
                    GestureDetector(
                        onTap:widget.showLoginPage,
                        child: const Text("Login", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.blueAccent, fontSize: 14)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
