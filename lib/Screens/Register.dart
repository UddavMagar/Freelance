import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance/Models/Users.dart';
import 'package:freelance/Widgets/errordialog.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  PickedFile _imagefile;
  final picker = ImagePicker();
  bool showFirst = true;
  bool loading = false;


  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _store = FirebaseFirestore.instance;

  Users _user = Users();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }


  Future _selectimage()async{
    final _imagefile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _user.userImg=_imagefile;
    });
  }

  bool ispicked(){
    if(_imagefile==null)
      return true;
    else
      return false;
  }



  Future<void> checktoUpload() async{
    if(_imagefile==null){
      showDialog(context: context,
      builder: (c)
          {
            return ErrorDialog(message: "Please select an image.",);
          }
      );
    }
    else if(_user.password!=_user.cpassowrd){
      showDialog(context: context,
          builder: (c)
          {
            return ErrorDialog(message: "Password doesnot match.",);
          }
      );
    }
    else if(_user.name.isEmpty||_user.email.isEmpty|| _user.password.isEmpty||_user.cpassowrd.isEmpty){
      showDialog(context: context,
          builder: (c)
          {
            return ErrorDialog(message: "Please enter empty field.",);
          }
      );
    }
    else{
      try{
        setState(() {
          loading = true;
        });
        var res = await _auth.createUserWithEmailAndPassword(email: _user.email, password: _user.password);

        setState(() {
          loading = false;
        });

        if(res.additionalUserInfo.isNewUser==true && res!=null){

          _user.id = res.user.uid;

          showFirst = false;


        }

        else{
          showInSnackBar('User Already Existed');
        }



      }

      catch(e){
        setState(() {
          loading = false;
        });
        showInSnackBar(e.toString());
      }
    }
    await _store.collection('users').add(_user.toMap());
    return Navigator.pushNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          _selectimage();
                        });
                      },
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.lightBlue,
                        backgroundImage: ispicked()? null: FileImage(File(_user.userImg.path)),
                        child: ispicked()?
                        Icon(Icons.add_photo_alternate,size: 30.0,color: Colors.white,):null,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                              hintText: "Name",
                              hintStyle: TextStyle(fontSize: 20,color: Colors.lightBlue,)
                          ),
                          onChanged: (value){
                            setState(() {
                                _user.name = value;
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
                          style: TextStyle(color: Colors.lightBlue),
                          decoration: InputDecoration(

                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(fontSize: 20,color: Colors.lightBlue,)
                          ),
                          onChanged: (value){
                            setState(() {
                                _user.email = value;
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
                          decoration: InputDecoration(

                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(fontSize: 20,color: Colors.lightBlue,)
                          ),
                          onChanged: (value){
                            setState(() {
                              _user.password = value;
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
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Conform password",
                              hintStyle: TextStyle(fontSize: 20,color: Colors.lightBlue,)
                          ),
                          onChanged: (value){
                            setState(() {
                                _user.cpassowrd = value;
                            });

                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
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
                                  checktoUpload();
                                });
                            },

                            child: Text("Sign Up",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
