import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:lottie/lottie.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',

      home: homescreen(),
    );
  }
}
class homescreen extends StatefulWidget {
  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  Random random = new Random();
  int n =1;
  double x = 0.35;
  double y = 1;
  String str = 'Hello!\n Roll a Dice';
  bool  show = false;
  bool show2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice App'),
        centerTitle: true,
      ),
      body: Stack(
            overflow: Overflow.visible,
            children: <Widget> [
             Positioned(
               top:MediaQuery.of(context).size.width*0.2,
               left: MediaQuery.of(context).size.width*0.1,
               child:  Visibility(
                 visible: show,
                 child: Lottie.asset(
                   'assets/loop.json',
                   height: MediaQuery.of(context).size.width*0.8,
                   repeat: false,
                   reverse: false,
                   animate: true,
                 ),
               ),
             ),
              Positioned(
                top:MediaQuery.of(context).size.width*0.5,
                left: MediaQuery.of(context).size.width*0.4,
                child:  Visibility(
                  visible: show2,
                  child: Text("$n",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width*0.3,
                    ),
                  ),
                ),
              ),
              Positioned(
                top:MediaQuery.of(context).size.width*y,
                left: MediaQuery.of(context).size.width*x,
                child: Text(
                    str,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      height: 1.5,
                    )
                ),
              ),
              Positioned(
                top:MediaQuery.of(context).size.width*1.25,
                left: MediaQuery.of(context).size.width*0.35,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      show = true;
                      show2 = false;
                      str = "Wait";
                      x = 0.44;
                      y = 0.2;
                    });
                    Future.delayed(const Duration(milliseconds: 5380), () {
                      setState(() {
                        show = false;
                        show2 = true;

                        n = random.nextInt(6) + 1;
                        str = 'You Got!';
                        x = 0.38;
                      });

                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),

                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                  color: Colors.blueAccent,
                  child: Text('Roll it!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),

                ),
              )
            ],
          ),
    );
  }
}
