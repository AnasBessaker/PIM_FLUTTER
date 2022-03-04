import 'package:ev/signin.dart';
import 'package:ev/Games.dart';
import 'package:ev/Phome.dart';
import 'package:ev/Basket.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _currentIndex = 0;
  final List<Widget> _interfaces = const [Phome(), Games(), Basket()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _interfaces[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.backspace_outlined ), label: "TIC TAC TOE"),
          BottomNavigationBarItem(
              icon: Icon(Icons.call_missed_outgoing_rounded), label: "Dino Jump"),
          BottomNavigationBarItem(
              icon: Icon(Icons.adjust_sharp), label: "Target practice")
        ],
        currentIndex: _currentIndex,
        onTap: (int value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
    ;
  }
}
