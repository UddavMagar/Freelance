import 'package:flutter/material.dart';
import 'package:freelance/Screens/submittedfinal.dart';


class Jobs extends StatefulWidget {

  final String jobTitles;
  final String jobDescriptions;
  Jobs({this.jobDescriptions,this.jobTitles});

  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Current Jobs',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
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
                      child: Text('${widget.jobTitles}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30.0),))
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
                  child: Text('${widget.jobDescriptions}',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                height:40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  border: Border.all(width: 1.0, color: Colors.lightBlue[200]),
                ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, 'upload');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Upload Files',style: TextStyle(color: Colors.lightBlue,)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 8.0),
              child: Text('Add comment on uploaded files.',style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0,right: 8.0, bottom: 8.0),
              child: Container(
                height: 100.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  border: Border.all(width: 1.0, color: Colors.lightBlue[200]),
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
                              submit: 'Updated project',
                            )
                        ));
                      });

                    },
                    child: Text('Submit',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                  ),
                ),

            ),

          ],
        ),
      ),
    );
  }
}
