import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Basket extends StatefulWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket> {
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
            child: Text('TARGET PRACTICE',style: TextStyle(color: Colors.yellow),),
          ),
        )],
      ),
    );
  }
}
