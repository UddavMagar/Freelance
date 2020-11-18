import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance/Screens/ProjectAvailable.dart';
import 'package:freelance/Screens/currentJob.dart';
import 'package:freelance/Widgets/bottomnavigation.dart';
import 'package:freelance/data/data.dart';




class DashBoard extends StatefulWidget {

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int hourHand;

  String greet;

  void Time(){
    DateTime now = DateTime.now();
    hourHand=now.hour;
    if(hourHand<=11){
        greet='Morning';
    }
    else {
      greet='Afternoon';
    }
      }

  @override
  Widget build(BuildContext context) {
    Time();
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Text('Good ${greet},',style: TextStyle(fontSize: 20,fontFamily: 'Pacifico',color: Colors.black45),),
                    Text('Uddav',style: TextStyle(fontSize: 25,fontFamily: 'Pacifico',color: Colors.black87),),
                  ],
                ),
                  Padding(
                    padding: EdgeInsets.only(left: 130.0),
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage('images/myphoto.png'),
                    ),
                  ),
              ],
              ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, 'invoice');
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        height:125.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Earning',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text("\$ 1000",style: TextStyle(fontSize: 35,color: Colors.white),),
                            ),


                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Container(
                          height:125.0,
                          width: 180.0,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom:8.0,top:5.0),
                                child: Center(child: Text('Current Jobs',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
                              ),
                              Container(
                                height: 85.0,
                                child: ListView.builder(
                                  itemCount: currentjobs.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemBuilder: (context, position) {
                                  return GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context)=>Jobs(
                                            jobTitles: currentjobs[position].jobName,
                                            jobDescriptions: currentjobs[position].jobDescription,
                                          )
                                        ));


                                      });
                                    },
                                    child: Container(
                                        height: 40,
                                        margin: EdgeInsets.all(5.0),
                                        width: 140.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.0),
                                          border: Border.all(width: 1.0, color: Colors.lightBlue[200]),
                                        ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('${currentjobs[position].jobName}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                          Text('${currentjobs[position].jobDescription}',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white),),
                                        ],
                                      )
                                ),
                                  );
                            },
                          ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.blue,
                        ),
                      ),
                      prefixIcon: (
                          Icon(Icons.search, size: 20.0)
                      ),
                      suffixIcon: (
                          Icon(Icons.close, size: 20.0,)
                      ),
                      hintText: "Search Projects",
                    ),
                  ),
                ),
                Container(
                  height: 20.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          left: 0.0,
                          child: Text('Projects',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)),
                      Positioned(
                        right: 0.0,
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              Navigator.pushNamed(context, 'projects');
                            });
                          },
                            child: Text('See all',style: TextStyle(fontSize: 18.0,color: Colors.grey[500]),)),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 200.0,
                  child: ListView.builder(
                    itemCount: currentjobs.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context)=>Projectavailable(
                                      newProjectPrice: projects[position].projectPrice,
                                      newProjectName: projects[position].projectName,
                                      newProjectDescription: projects[position].projectDescription,
                                      newProjectrequirements: projects[position].requirement,
                                    )
                                ));


                              });
                            },
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(projects[position].icon,
                                  color: Colors.lightBlue
                                  ),
                                ),
                              Positioned(
                                  left: 50.0,
                                  child: Text('${projects[position].projectName}',overflow: TextOverflow.clip,
                                      style: TextStyle(fontWeight: FontWeight.bold))),
                              Positioned(
                                right: 5.0,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.lightBlue,
                                    ),
                                    child: Text('\$ ${projects[position].projectPrice}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                                ),
                              ),
                              Positioned(
                                  bottom: 10.0,
                                  left: 50.0,
                                  child: Text('${projects[position].projectDescription}',overflow: TextOverflow.ellipsis)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
            ),
          ),
            Expanded(
              child: MyBottomNavigationBar(
                bottomvalue: 0,
              ),
            ),
      ],
        ),
      ),
    );
  }
}
