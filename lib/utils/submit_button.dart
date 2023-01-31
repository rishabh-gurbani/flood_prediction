import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({required this.string,required this.action, super.key});

  final String string;
  final Future<dynamic> Function() action;
  var ts = const TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 17);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
      child: GestureDetector(
        onTap: (){
          action();
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.deepOrange[500]
          ),
          child: Center(
            child: Text(string, style: ts,),
          ),
        ),
      ),
    );
  }
}
