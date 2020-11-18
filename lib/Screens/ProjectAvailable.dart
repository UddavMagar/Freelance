import 'package:flutter/material.dart';

import 'ProjectProposal.dart';

class Projectavailable extends StatefulWidget {

  final String newProjectName;
  final String newProjectDescription;
  final int newProjectPrice;
  final List<String> newProjectrequirements;
  Projectavailable({this.newProjectDescription,this.newProjectName,this.newProjectPrice,this.newProjectrequirements});



  @override
  _ProjectavailableState createState() => _ProjectavailableState();
}

class _ProjectavailableState extends State<Projectavailable> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Projects',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              width: double.infinity,

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/backphoto.png'),
                  fit: BoxFit.cover,
                ),

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),),

              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 60.0,
                      child: Text('${widget.newProjectName}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30.0),))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 1.0, color: Colors.lightBlue[200]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${widget.newProjectDescription}',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Project Price:    \$ ${widget.newProjectPrice}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,
              color: Colors.lightBlue)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 8.0),
              child: Text('Skills and Expertise',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0)),
            ),
            Container(
              height: 130.0,
              width: double.infinity,
              child: ListView.builder(
                itemCount: widget.newProjectrequirements.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, position) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${widget.newProjectrequirements[position]}'),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: FlatButton(
                  color: Colors.lightBlue,
                  onPressed: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>Projectproposal(
                            proposalProjectDescription: widget.newProjectDescription,
                            proposalProjectName: widget.newProjectName,

                          )
                      ));


                    });
                  },
                  child: Text('Apply for Project',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white)),
                ),
              ),

            ),
          ],
        )
      ),

    );
  }
}
