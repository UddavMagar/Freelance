import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ErrorDialog extends StatelessWidget {
  final String message;
  ErrorDialog({this.message});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message),
      actions: <Widget>[
        RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          color: Colors.red,
          child: Center(child: Text('Ok')),
        ),
      ],
    );
  }
}
