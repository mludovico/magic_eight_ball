import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Eight Ball',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key,}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final answers = ['YES', 'NO', 'ASK AGAIN LATER', 'THE ANSWER IS YES',
    'I HAVE NO IDEIA', ];
  int answerNumber = 1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent[200],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Ask me anything...'
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: FlatButton(
              onPressed: (){
                setState(() {
                  answerNumber = Random().nextInt(5);
                });
                print(answers[answerNumber]);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage('images/ball1.png'),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 265,
            left: 178,
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Color.fromARGB(255, 1, 90, 170),
                      Color.fromARGB(255, 0, 64, 121)
                    ],
                    radius: 0.7,
                    center: Alignment(0, -0.25)
                  )
                ),
                width: 62,
                height: 65,
                child: Center(
                  child: Text(
                    answers[answerNumber],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 12, 165, 216),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
