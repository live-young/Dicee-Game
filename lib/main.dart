import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';

import 'package:flutter/widgets.dart';

// Make it with single and double dice option;

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Rock and Roll'),
          backgroundColor: Colors.white12,
        ),
        body: MainPage(),
      ),
    ),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Card buttons(String msg){
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50),
        color: Colors.white,
        child: ListTile(
          title: Text('$msg', textAlign: TextAlign.center, style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
      );
  }

  Future navigateToTwoDicePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TwoDice()));
  }

  ////
  Future navigateToDiceGamePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DiceGame()));
  }
////

  Future navigateToOneDicePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => OneDice()));
  }

  /////


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('images/homepageicon.jpg') ,
          radius: 80.0,
          backgroundColor: Colors.grey,

        ),
       SizedBox(
         height: 60.0,
       ),
       FlatButton(
           onPressed: () {
             navigateToOneDicePage(context);
           },
           child: buttons('Single Dice')
       ),
        FlatButton(
          onPressed: () {
          navigateToTwoDicePage(context);
          },
            child: buttons('Two Dice'),
        ),
        FlatButton(
            onPressed: () {
              navigateToDiceGamePage(context);
            },
            child: buttons('Dice Game')
        ),

      ],
    );
  }
}


class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int leftDice = 1;
  int rightDice = 1;
  int lScore = 0;
  int rScore = 0;

  Future navigateToMainPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }


  // user defined function
  Widget _showDialog(String side) {
    // flutter defined function
   return  CupertinoAlertDialog(
     title: Text('Congratulations!' ,style: TextStyle(
         color: Colors.green[800],
       fontSize: 28.0,
       fontWeight: FontWeight.bold
     ),),
     content: Text('$side player wins!', style: TextStyle(
    color: Colors.black,
       fontSize: 22.0,
       fontWeight: FontWeight.bold
    ),),
    // backgroundColor: Colors.green[800],
     actions: <Widget>[
       FlatButton( onPressed: () {
           navigateToMainPage(context);
          },
           child: Text('Close', style: TextStyle(
             color: Colors.black,
           ),))
     ],
   );

      }


  @override
  Widget build(BuildContext context) {
    if (lScore < 50 && rScore < 50) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text('Score: $lScore', style: TextStyle(
                      fontFamily: 'Times New Roman',
                      color: Colors.white,
                      fontSize: 25.0,),
                    ),

                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Text('Score: $rScore', style: TextStyle(
                      fontFamily: 'Times New Roman',
                      color: Colors.white,
                      fontSize: 25.0,)
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[

                Center(
                  child: Text('Click your Dice',
                      style: TextStyle(
                        fontFamily: 'Times New Roman',
                        color: Colors.white,
                        fontSize: 35.0,
                      )),
                ),
                Center(
                  child: Text('The one to reach 50 first, wins.',
                      style: TextStyle(
                        fontFamily: 'Times New Roman',
                        color: Colors.white,
                        fontSize: 25.0,
                      )),
                ),
                SizedBox(
                  height: 40.0,
                ),

                Container(
                  child: Row(
                    children: <Widget>[

                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              leftDice = Random().nextInt(6) + 1;
                              lScore = lScore + leftDice;
                            });
                          },
                          child: Image.asset('images/dice$leftDice.png'),
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              rightDice = Random().nextInt(6) + 1;
                              rScore = rScore + rightDice;
                            });
                          },
                          child: Image.asset('images/dice$rightDice.png'),

                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),


            Container(

            )
          ],

        ),
      );
    }
    else{
      if (lScore == 50)
        {
         return _showDialog("Left");
        }
      else {
        return _showDialog("Right");
      }
    }
  }
}

///////



class TwoDice extends StatefulWidget {
  @override
  _TwoDiceState createState() => _TwoDiceState();
}

class _TwoDiceState extends State<TwoDice> {
  int leftDice = 1;
  int rightDice=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text('Click any of the 2 Dice',
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  color: Colors.white,
                  fontSize: 35.0,
                )),
          ),
          SizedBox(
            height: 40.0,
          ),

          Container(
            child: Row(
              children: <Widget>[

                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        leftDice = Random().nextInt(6) + 1;
                        rightDice = Random().nextInt(6) + 1;

                      });
                    },
                    child: Image.asset('images/dice$leftDice.png'),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        rightDice = Random().nextInt(6) + 1;
                        leftDice = Random().nextInt(6) + 1;
                      });
                    },
                    child: Image.asset('images/dice$rightDice.png'),

                  ),
                ),
              ],
            ),
          ),
        ],

      ),
    );
  }
}

////////////


class OneDice extends StatefulWidget {
  @override
  _OneDiceState createState() => _OneDiceState();
}

class _OneDiceState extends State<OneDice> {
  int leftDice = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text('Press to Roll the Dice',
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  color: Colors.white,
                  fontSize: 35.0,
                )),
          ),
          SizedBox(
            height: 40.0,
          ),

          Container(
            child: Row(
              children: <Widget>[

                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        leftDice = Random().nextInt(6) + 1;
                      });
                    },
                    child: Image.asset('images/dice$leftDice.png'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

