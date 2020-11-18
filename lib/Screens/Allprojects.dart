import 'package:flutter/material.dart';
import 'package:freelance/Screens/ProjectAvailable.dart';
import 'package:freelance/data/data.dart';

class allProjects extends StatefulWidget {
  @override
  _allProjectsState createState() => _allProjectsState();
}
class _allProjectsState extends State<allProjects> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Projects',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        ),
        body: Column(
          children: <Widget>[
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
            Expanded(
              child: ListView.builder(
                itemCount: currentjobs.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, position) {
                  return GestureDetector(
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
                    child: Container(
                        height: 100,
                        margin: EdgeInsets.all(5.0),
                        width: 140.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(width: 1.0, color: Colors.lightBlue[200]),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(projects[position].icon,
                                color: Colors.lightBlue,
                                size: 30.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text('${projects[position].projectName}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 80.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.0),
                                            color: Colors.lightBlue,
                                          ),
                                          child: Text('Rs.${projects[position].projectPrice}',style: TextStyle(
                                              fontWeight: FontWeight.bold,color: Colors.white,
                                          fontSize: 25.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text('${projects[position].projectDescription}',overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 15.0),),
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                  );
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}
