import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freelance/Models/Login.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}


LoginId _LoginId= LoginId();
bool loading = false;


FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _store = FirebaseFirestore.instance;

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

void showInSnackBar(String value) {
  _scaffoldKey.currentState
      .showSnackBar(new SnackBar(content: new Text(value)));
}


class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text("FreeLance", style: TextStyle(fontSize: 40,fontFamily: 'Pacifico',color: Colors.blue),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.lightBlue))
                            ),
                            child: TextField(
                              style: TextStyle(color: Colors.lightBlue),
                              decoration: InputDecoration(

                                  border: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle: TextStyle(fontSize: 20,color: Colors.lightBlue,)
                              ),
                              onChanged: (value){
                                setState(() {
                                  _LoginId.loginEmail=value;
                                });

                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.lightBlue))
                            ),
                            child: TextField(
                              obscureText: true,
                              style: TextStyle(color: Colors.lightBlue),
                              onChanged: (value){
                                setState(() {
                                  _LoginId.loginPassword=value;
                                });

                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(fontSize: 20,color: Colors.lightBlue,)
                              ),
                            ),
                          ),
                          Container(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: (){
                                      setState(() {

                                      });
                                    },
                                    child: Text("Forget Password?",style: TextStyle(fontSize: 15,color: Colors.blue),
                                    ),
                                  ))),
                          SizedBox(height: 30),
                          Column(
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.lightBlue,
                                  border: Border.all(color: Colors.blue),

                                ),
                                child: RaisedButton(
                                  color: Colors.deepPurple,
                                  onPressed: () async{
                                    try {
                                      setState(() {
                                        loading = true;
                                      });
                                      var res = await _auth.signInWithEmailAndPassword(
                                          email:_LoginId.loginEmail,
                                          password:  _LoginId.loginPassword);
                                      Navigator.pushNamed(context, 'dashboard');
                                      setState(() {
                                        loading = false;
                                      });


                                    }
                                    catch(e){
                                      setState(() {
                                        loading = false;
                                      });
                                      showInSnackBar(e.toString());
                                    }


                                  },


                                  child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),

                                  ),
                                ),
                              ),
                              Text("or",style: TextStyle(fontSize: 15,color: Colors.lightBlue),),
                              Container(
                                height: 50,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.lightBlue,
                                  border: Border.all(color: Colors.blue),

                                ),
                                child: RaisedButton(
                                  color: Colors.deepPurple,
                                  onPressed: (){
                                    setState(() {
                                      Navigator.pushNamed(context, 'register');
                                    });
                                  },

                                  child: Text("Sign Up",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
