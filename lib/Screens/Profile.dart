import 'package:flutter/material.dart';
import 'package:freelance/Widgets/bottomnavigation.dart';
import 'package:freelance/data/data.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
        ),
        body:
        Column(
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage('images/myphoto.png'),
                      ),
                      Column(
                        children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Text('Uddav',style: TextStyle(fontSize: 20,color: Colors.black87,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.location_on,color: Colors.lightBlue),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Dhapakhel'),
                              )
          ],
          ),
                        ),
            ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${profileModel[0].skill}',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('${profileModel[0].profiledescription}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                    Custombox(
                      customint: '\$ ${profileModel[0].hourlyrate}',
                      customdescription: 'Hourly rate',
                    ),
                      Custombox(
                        customint: '\$ ${profileModel[0].totalEarning}K+',
                        customdescription: 'Total earnings',
                      ),
              ],
                  ),
                  Row(
                    children: <Widget>[
                      Custombox(
                        customint: '${profileModel[0].totalJobs}',
                        customdescription: 'Jobs',
                      ),
                      Custombox(
                        customint: '${profileModel[0].hoursworked}',
                        customdescription: 'Hours Worked',
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                    child: Text('Skills and Expertise',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0)),
                  ),
                  Container(
                    height: 110.0,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: profileModel[0].expertise.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, position) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${profileModel[0].expertise[position]}'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
            Expanded(
              child: MyBottomNavigationBar(
                bottomvalue: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Custombox extends StatelessWidget {

  final String customint;
  final String customdescription;
  const Custombox({
    Key key,
    this.customint,
    this.customdescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 170.0,
      child: Column(
        children: <Widget>[
          Text(customint,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.lightBlue),),
          Text(customdescription),
      ],
    ),
    );
  }
}
