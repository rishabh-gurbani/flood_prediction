import '/utils/input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/utils/submit_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset(previousContext) async{
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());

      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text("Password reset link sent to email"),
          actions: [
            MaterialButton(
              color: Colors.deepOrange,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(previousContext);//close Dialog
              },
              child: Center(child: Text('Continue', style: TextStyle(color: Colors.white),)),
            ),
          ],
        );
      });

    } on FirebaseAuthException catch(e){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.deepOrange,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.grey[300],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.lock_reset, size: 50,),
              SizedBox(width: 15,),
              Text("Reset Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ],
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text('Enter Email ID to reset password',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
              ],
            ),
          ),
          InputField(controller: _emailController, isPassword: false,
            onChanged: (string){}, prompt: 'Enter Email',
          ),

          SubmitButton(string: 'Send link', action: () async{
            passwordReset(context);
          }),
        ],
      ),
    );
  }


}
