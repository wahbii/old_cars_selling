import 'package:cars_sell/presentation/views/cars/CarsScreen.dart';
import 'package:cars_sell/presentation/views/login/LoginScreen.dart';
import 'package:cars_sell/presentation/views/search/SearchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {


  static const path = "HomeScreen";



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _HomeScreen();
  }

}

class _HomeScreen extends State<HomeScreen>{
  int _selectedIndex = 3;
  List<Widget> widgets = [CarsScreen(),SearchScreen(),LoginScreen(),LoginScreen()];


  @override
  Widget build(BuildContext context) {
   return Scaffold(

     body: widgets[_selectedIndex],
     bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
       currentIndex: _selectedIndex,
       items: const <BottomNavigationBarItem>[
         BottomNavigationBarItem(
           icon: Icon(Icons.home),
           label: 'Home',
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.search),
           label: 'Search',
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.chat),
           label: 'Chats',
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           label: 'Account',
         ),
       ],
       onTap: _onItemTapped,
     ),
   );




  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}