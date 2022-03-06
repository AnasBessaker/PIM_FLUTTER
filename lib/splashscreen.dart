import 'dart:async';

import 'package:ev/Home.dart';
import 'package:ev/Phome.dart';
import 'package:ev/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
    startTime();
  }
  static const darkBlue = const Color(0xff0E2433);

  @override
  Widget build(BuildContext context) {
    /* return FutureBuilder(
      future: _session,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("G-Store ESPRIT"),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (route == "/navbar") {
            return const NavBar();
          } else {
            return const Signin();
          }
        }
      },
    );*/

    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 4);
    return new Timer(duration, routee);
  }

  routee() {
  Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Signin()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      body: Center(
        child: Image.asset("assets/Logo.png"),
        
      ),
    );
  }
}
