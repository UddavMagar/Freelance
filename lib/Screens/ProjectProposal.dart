import 'package:flutter/material.dart';
import 'package:freelance/Screens/proposalsubmit.dart';


class Projectproposal extends StatefulWidget {
  final String proposalProjectName;
  final String proposalProjectDescription;

  Projectproposal({this.proposalProjectDescription,this.proposalProjectName});


  @override
  _ProjectproposalState createState() => _ProjectproposalState();
}

class _ProjectproposalState extends State<Projectproposal> {

  int money=100;


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
              height:150,
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
                  Center(child: Text('${widget.proposalProjectName}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${widget.proposalProjectDescription}',style: TextStyle(fontSize: 15,color: Colors.white),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('What is Your Rate for this Project?',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 150.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(width: 1.0, color: Colors.lightBlue[200]),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('\$  ', style: TextStyle(fontSize: 45.0,fontWeight: FontWeight.bold,color: Colors.white),),
                          Text(money.toString(),
                            style: TextStyle(fontSize: 45.0,fontWeight: FontWeight.bold,color: Colors.white),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.orange,
                          inactiveTickMarkColor: Colors.white,
                          thumbColor: Colors.deepOrange,
                          overlayColor: Colors.orange[200],
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                        ),
                        child: Slider(
                          value: money.toDouble(),
                          min: 5.0,
                          max: 100.0,
                          onChanged: (double value){
                            setState(() {
                              money=value.round();
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('UpLoad Your Proposal',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    Navigator.pushNamed(context, 'upload');
                  });
                },
                child: Container(
                  height:40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    border: Border.all(width: 1.0, color: Colors.lightBlue[200]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Upload Files',style: TextStyle(color: Colors.lightBlue,)),
                  ),
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
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>proposalSecond(
                            proposalProjectDescriptions: widget.proposalProjectDescription,
                            proposalProjectNames: widget.proposalProjectName,

                          )
                      ));


                    });
                  },
                  child: Text('Next',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white)),
                ),
              ),

            ),
      ],
    ),
              ),
            );
  }
}
