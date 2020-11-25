import 'package:flutter/material.dart';
import 'package:freelance/Widgets/bottomnavigation.dart';
import 'package:freelance/data/data.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Inbox',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: inboxmessage.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, position) {
                  return SizedBox(
                    height: 140,
                    child: Card(
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text('${inboxmessage[position].inboxTitle}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                          ),
                          Positioned(
                            top:20.0,
                              right: 20.0,
                              child: Text('${inboxmessage[position].inboxMonth} ${inboxmessage[position].inboxDay}')
                          ),

                          Positioned(
                            top: 50.0,
                              left: 15.0,
                              child: Container(
                                height: 100,
                                  width: 300,
                                  child: Text(inboxmessage[position].inboxMessage,overflow: TextOverflow.ellipsis,maxLines: 5,)),
                              ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            MyBottomNavigationBar(
              bottomvalue: 2,
            ),
          ],
        ),
      ),
    );
  }
}
