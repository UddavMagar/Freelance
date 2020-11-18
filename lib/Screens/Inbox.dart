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
                  return Card(
                    child: Stack(
                      children: <Widget>[
                        Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text('${inboxmessage[position].inboxTitle}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                          ),
                          Text('         ${inboxmessage[position].inboxMonth}'),
                          Text(' ${inboxmessage[position].inboxDay}'),
                        ],
                          ),
                        Positioned(
                          top: 50.0,
                            left: 15.0,
                            child: Text(inboxmessage[position].inboxMessage,)),
                      ],
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
