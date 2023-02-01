import 'package:flood_prediction_app/pages/app/history_page.dart';
import 'package:flutter/material.dart';
import 'predict_page.dart';
import 'user_info_page.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  // final List<Widget> _pages = [
  //   PredictScreen(),
  //   HistoryPage(),
  //   UserInfoPage()
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: IndexedStack(
        children: const <Widget>[PredictScreen(), HistoryPage(), UserInfoPage()],
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _navigateBottomBar,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.deepOrange,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.online_prediction), label : "Predict"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label : "History"),
          BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle), label : "User"),
      ],

      ),
    );
  }
}

