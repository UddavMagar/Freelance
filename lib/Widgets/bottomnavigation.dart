import 'package:flutter/material.dart';
import 'package:freelance/Screens/Profile.dart';

class MyBottomNavigationBar extends StatefulWidget {

  final int bottomvalue;

  MyBottomNavigationBar({this.bottomvalue});
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {


  bool isactive(int indexvalue){
    if(indexvalue==widget.bottomvalue){
      return true;
    }
    else
      return false;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 60.0,
         child:Row(
          children: <Widget>[
            BottomNav(icon: Icons.dashboard, index: 0,icontitle: 'DashBoard',pages: 'dashboard',isActive: isactive(0)),
            BottomNav(icon: Icons.attach_money, index: 1,icontitle: 'Invoice',pages: 'invoice',isActive: isactive(1)),
            BottomNav(icon: Icons.mail, index: 2,icontitle: 'Inbox',pages: 'inbox',isActive: isactive(2)),
            BottomNav(icon: Icons.person, index: 3,icontitle: 'Profile',pages: 'profile',isActive: isactive(3)),
          ],
      ),
      ),
    );
  }
}



class BottomNav extends StatelessWidget {

  IconData icon;
  String icontitle;
  int index;
  String pages;
  bool isActive;
  String userName;
  String imageName;


  BottomNav({this.icon,this.index,this.icontitle,this.pages,this.isActive,this.userName,this.imageName});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, pages);
      },
      child: Container(
          height: 60.0,
          width: MediaQuery.of(context).size.width/4,
          decoration: BoxDecoration(
            color: Colors.lightBlue
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Icon(icon,
                  color: isActive ? Colors.white : Colors.black45,
                  size: 25.0,
                ),
                Visibility(
                    visible: isActive,
                    child: Text('$icontitle',style: TextStyle(color: Colors.white))),
              ],
            ),
          ),
      ),
    );
  }
}





