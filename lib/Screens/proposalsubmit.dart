import 'package:flutter/material.dart';
import 'package:freelance/Screens/submittedfinal.dart';

class proposalSecond extends StatefulWidget {

  final String proposalProjectNames;
  final String proposalProjectDescriptions;

  proposalSecond({this.proposalProjectDescriptions,this.proposalProjectNames});


  @override
  _proposalSecondState createState() => _proposalSecondState();
}

class _proposalSecondState extends State<proposalSecond> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Project Proposal',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height:120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(child: Text('${widget.proposalProjectNames}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${widget.proposalProjectDescriptions}',style: TextStyle(fontSize: 15,color: Colors.white),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 8.0),
              child: Text('Do you have a suggestion to make this project run successfully?',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0,right: 8.0, bottom: 8.0),
              child: Container(
                height: 120.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  border: Border.all(width: 1.0, color: Colors.lightBlue[200]),
                ),
                child: TextField(
                  onChanged: (value){
                    setState(() {

                    });
                  },
                  maxLines: 10,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 8.0),
              child: Text('What part of the project most appeals to you?',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0,right: 8.0, bottom: 8.0),
              child: Container(
                height: 130.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  border: Border.all(width: 1.0, color: Colors.lightBlue[200]),
                ),
                child: TextField(
                  onChanged: (value){
                    setState(() {

                    });
                  },
                  maxLines: 10,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: FlatButton(
                  color: Colors.lightBlue,
                  onPressed: (){
                    setState(() {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context)=>Submittedfinal(
                              submit: 'proposal',
                          )
                      ));
                    });
                  },
                  child: Text('Submit',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white)),
                ),
              ),

            ),
          ],
        )
      ),
    );
  }
}
