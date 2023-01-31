import 'pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        theme: ThemeData(
          // Define the default brightness and colors.
          primaryColor: Colors.deepOrange,
        ),

      debugShowCheckedModeBanner: false,
      title: "loginDemo",
      home: MainPage()
    );
  }
}



