import 'package:flutter/material.dart';
import 'package:freelance/Widgets/bottomnavigation.dart';
import 'package:freelance/data/data.dart';

class Invoice extends StatefulWidget {

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  int earning=profileModel[0].currentEarning;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Invoice',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0),),
                  color: Colors.lightBlue,
                ),
                child: Text('Earning:    \$ ${profileModel[0].currentEarning.toString()}',style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0,left: 8.0),
              child: Container(
                height: 170.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(width: 1.0, color: Colors.lightBlue[200]),
                ),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('\$  ', style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold,color: Colors.white),),
                          Text(earning.toString(),
                            style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold,color: Colors.white),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                          value: earning.toDouble(),
                          min: 0.0,
                          max: earning.toDouble(),
                          onChanged: (double value){
                            setState(() {
                              earning=value.round();
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: FlatButton(
                        color: Colors.purpleAccent,
                        onPressed: (){
                          setState(() {


                          });
                        },
                        child: Text('WithDraw',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('Invoice',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            ),
            Container(
              height: 200.0,
              child: ListView.builder(
                itemCount: transaction.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, position) {
                  return Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text('Rs.   ${transaction[position].transactionamount}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                              ),
                              Text('${transaction[position].transactionmonth}'),
                              Text(' ${transaction[position].transactionday}      '),
                              Text('By ${transaction[position].transactionBy}',style: TextStyle(fontWeight: FontWeight.bold),),

                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: MyBottomNavigationBar(
                bottomvalue: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
