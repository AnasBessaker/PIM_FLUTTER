import 'package:flutter/material.dart';

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  _GamesState createState() => _GamesState();
}


class _GamesState extends State<Games> {
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
            child: Text('DINO GAME',style: TextStyle(color: Colors.yellow),),
          ),
        )],
      ),
    );
  }
}
