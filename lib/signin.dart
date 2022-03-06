import 'dart:ffi';

import 'package:ev/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  late String? password;
  late String? email;
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  static const darkBlue = const Color(0xff0E2433);
  static const lightBlue = const Color(0xff296D98);

  //actions
  Future<void> insertSharedPrefs(String id) async {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setString('username', email!);
      prefs.setString('id', id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Sign-back.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: keyForm,
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.7,
                    heightFactor: 0.7,
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/White-rect.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            reverse: true,
                            child: Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  child: TextFormField(
                                    style: TextStyle(
                                        fontFamily: 'Pixel',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: lightBlue,
                                        enabledBorder: new OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(3.0),
                                          borderSide: BorderSide(
                                              color: darkBlue, width: 5.0),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "Email",
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                    onSaved: (String? value) {
                                      email = value;
                                    },
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Le username ne doit pas etre vide";
                                      } else if (value.length < 5) {
                                        return "Le username doit avoir au moins 5 caractères";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  child: TextFormField(
                                    style: TextStyle(
                                        fontFamily: 'Pixel',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: lightBlue,
                                        enabledBorder: new OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(3.0),
                                          borderSide: BorderSide(
                                              color: darkBlue, width: 5.0),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                    onSaved: (String? value) {
                                      password = value;
                                    },
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Le mot de passe ne doit pas etre vide";
                                      } else if (value.length < 5) {
                                        return "Le mot de passe doit avoir au moins 5 caractères";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home()));
                                  },
                                  child: Image.asset("assets/Login-button.png"),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
