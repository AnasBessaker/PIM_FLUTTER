import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {


  late String? password;
  late String? email;
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  static const darkBlue = const Color(0xff0E2433);

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
          backgroundColor: darkBlue,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: keyForm,
                child: ListView(
                  children: [
                
                    Image.asset("assets/Logo.png"),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: TextFormField(
                        style: TextStyle(fontFamily: 'Pixel',color: Colors.yellow,fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            enabledBorder: new OutlineInputBorder(
                               borderRadius: new BorderRadius.circular(3.0),
                               borderSide:  BorderSide(color: Colors.yellow,
                               width: 5.0 ),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.yellow)
                            ),
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
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: TextFormField(
                        style: TextStyle(fontFamily: 'Pixel',color: Colors.yellow,fontWeight: FontWeight.bold),
                        obscureText: true,
                        decoration: InputDecoration(
                           enabledBorder: new OutlineInputBorder(
                               borderRadius: new BorderRadius.circular(3.0),
                               borderSide:  BorderSide(color: Colors.yellow,
                               width: 5.0 ),
                            ),
	                              border: OutlineInputBorder(),
	                              hintText: "Password",
	                              hintStyle: TextStyle(color: Colors.yellow)
	                            ),
                            
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
                    
                    SizedBox(
                            height: 20,
                          ),
                    Container(
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.yellow),
                            ),
                            child: const Text("S'authentifier",
                            style: TextStyle(fontFamily: 'Pixel',color: darkBlue,fontWeight: FontWeight.bold)),
                            onPressed: () {
                              if (keyForm.currentState!.validate()) {
                                keyForm.currentState!.save();
                                //URL
                                String _baseUrl = "172.27.48.1:3000";
                                //Headers
                                Map<String, String> headers = {
                                  "Content-Type":
                                      "application/json; charset=UTF-8"
                                };
                                //Body
                                Map<String, dynamic> userData = {
                                  "email": email,
                                  "password": password
                                };
                                //Exec
                                http
                                    .post(Uri.http(_baseUrl, '/users/login'),
                                        headers: headers,
                                        body: json.encode(userData))
                                    .then((http.Response response) {
                                  if (response.statusCode == 200) {
                                    Map<String, dynamic> res =
                                        json.decode(response.body);
                                    var userId = res['_id'];
                                    var username = res['firstname'];
                                    insertSharedPrefs(userId).then((value) =>
                                        Navigator.pushReplacementNamed(
                                            context, "/games"));
                                  } else if (response.statusCode == 401) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Row(
                                            children: [
                                              Icon(Icons.info),
                                              Text('Information'),
                                            ],
                                          ),
                                          content: Text(
                                              'Username ou Mot de passe incorrect!'),
                                        );
                                      },
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Row(
                                            children: [
                                              Icon(Icons.info),
                                              Text('Information'),
                                            ],
                                          ),
                                          content: Text(
                                              'Oups! Veuiller réessayer plus tard.'),
                                        );
                                      },
                                    );
                                  }
                                });
                              }
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.yellow),
                            ),
                            child: const Text("Create account",
                            style: TextStyle(fontFamily: 'Pixel',color: darkBlue,fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "/home");
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          )),
    );
  }
}
