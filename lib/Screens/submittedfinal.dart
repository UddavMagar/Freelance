import 'package:flutter/material.dart';

class Submittedfinal extends StatefulWidget {
  final String submit;
  Submittedfinal({this.submit});
  @override
  _SubmittedfinalState createState() => _SubmittedfinalState();
}

class _SubmittedfinalState extends State<Submittedfinal> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () async {
      Navigator.pushReplacementNamed(context, 'dashboard');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/thumbup.png'),
            ),
              Center(child: Text('You have submitted your ${widget.submit}.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0))),
          ],
          ),
        ),
      ),
    );
  }
}
