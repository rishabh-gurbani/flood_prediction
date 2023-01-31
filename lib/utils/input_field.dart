import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField(
      {required this.prompt,super.key,
        required this.isPassword, required this.controller,
        required this.onChanged
      });

  final String prompt;
  final bool isPassword;
  final TextEditingController controller;
  Function(String) onChanged;


  void pass(callback){
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: TextField(
        autocorrect: false,
        onChanged: onChanged,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide (color: Colors.white),
            borderRadius: BorderRadius.circular (12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange),
            borderRadius: BorderRadius.circular (12),
          ),
          border: InputBorder.none,
          fillColor: Colors.grey[50],
          filled: true,
          hintText: prompt,
        ),
      ),
    );
  }
}
