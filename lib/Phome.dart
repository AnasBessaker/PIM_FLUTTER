import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

class Phome extends StatefulWidget {
  const Phome({Key? key}) : super(key: key);

  @override
  _PhomeState createState() => _PhomeState();
}

class _PhomeState extends State<Phome> {
  //var

  @override
  void initState() {
    super.initState();
  }
  static const darkBlue = const Color(0xff0E2433);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:darkBlue ,
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('TIC TAC TOE',style: TextStyle(color: Colors.yellow),),
          ),
        )],
      ),
    );
  }
}


