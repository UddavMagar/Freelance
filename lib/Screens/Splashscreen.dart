import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'Dashboard.dart';
import 'Login.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {



  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 7), () async {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context)=>Login()
        )
      );
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: Color(0xff7f00ff),
              highlightColor: Color(0xffe100ff),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text("FreeLance",style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'Pacifico',
                    shadows: <Shadow>[
                      Shadow(
                          blurRadius: 18.0,
                          color: Colors.black87,
                          offset: Offset.fromDirection(120, 12)
                      ),
                    ],
                  ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}