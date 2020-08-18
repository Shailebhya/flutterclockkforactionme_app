import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterclockkforactionme_app/4quads.dart';
import 'package:flutterclockkforactionme_app/clock_button.dart';
import 'package:flutterclockkforactionme_app/models/chat_model.dart';

class MyCLock extends StatefulWidget {
  @override
  _MyCLockState createState() => _MyCLockState();
}

class _MyCLockState extends State<MyCLock> {
  var b;
  var a = List();
  bool enabled = false;
//  Color col,col1,col2,col3 = Colors.grey;
  checkList(){
    if(enabled){    setState(() {
      if(b==0)
        a= dummyData;
      if(b==1)
        a = dummyData1;
      if(b==2)
        a = dummyData2;
      if(b==3)
        a = dummyData3;
    });}
    else{
      setState(() {
        if(b==0)
          a= dummyData4;
        if(b==1)
          a = dummyData5;
        if(b==2)
          a = dummyData6;
        if(b==3)
          a = dummyData7;
      });
    }



  }



//  myColors(){
//    setState(() {
//      if(b==0)
//        col= Colors.greenAccent;
//      if(b==1)
//        col1 = Colors.greenAccent;
//      if(b==2)
//        col2 = Colors.greenAccent;
//      if(b==3)
//        col3= Colors.greenAccent;
//
//    });
//  }
  List<ClockButton> doInit() {
    var clockButtons = <ClockButton>[
      ClockButton(id: 1,bg: Colors.redAccent),
      ClockButton(id: 2),
      ClockButton(id: 3),
      ClockButton(id: 4)
    ];
    return clockButtons;
  }

//  void workClock(ClockButton cb) {
//    setState(() {
//      if (cb.id == 1) {
//        cb.bg = Colors.redAccent;
//        checkTimeToGetList();
//        cb.enabled = true;
//      }
//      cb.enabled = false;
//      if (cb.id == 2) {
//        cb.bg = Colors.redAccent;
//        checkTimeToGetList();
//        cb.enabled = true;
//      }
//      cb.enabled = false;
//      if (cb.id == 3) {
//        cb.enabled = true;
//        cb.bg = Colors.redAccent;
//        checkTimeToGetList();
//      }
//      cb.enabled = false;
//      if (cb.id == 4) {
//        cb.enabled = true;
//        cb.bg = Colors.redAccent;
//        checkTimeToGetList();
//      }
//      cb.enabled = false;
//
//    });
//  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 38.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){b=0;checkList();},
              child: SizedBox(
                  width:  150 ,
                  height:  150 ,
                  child: Stack(
                    children: [
                      QuarterCircle(
                          circleAlignment: CircleAlignment.bottomRight,
                          color:Colors.greenAccent),
                      Padding(
                        padding: const EdgeInsets.only(left:60.0,top: 60),
                        child: Text("9-12",style: TextStyle(
                          fontSize: 30,color: Colors.white
                        ),),
                      )
                    ],
                  )),
            ),
            GestureDetector(
              onTap: (){b=1;checkList();},
              child: SizedBox(
                  width:  150 ,
                  height:  150 ,
                  child: Stack(
                    children: [
                      QuarterCircle(
                          circleAlignment: CircleAlignment.bottomLeft,
                          color:Colors.greenAccent),
                      Padding(
                        padding: const EdgeInsets.only(left:60.0,top: 60),
                        child: Text("0-3",style: TextStyle(
                            fontSize: 30,color: Colors.white
                        ),),
                      )
                    ],
                  ))
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){b=2;checkList();},
              child: SizedBox(
                  width:  150 ,
                  height:  150 ,
                  child: Stack(
                    children: [
                      QuarterCircle(
                          circleAlignment: CircleAlignment.topRight,
                          color:Colors.greenAccent),
                      Padding(
                        padding: const EdgeInsets.only(left:60.0,top: 60),
                        child: Text("3-6",style: TextStyle(
                            fontSize: 30,color: Colors.white
                        ),),
                      )
                    ],
                  ))
            ),
            GestureDetector(
              onTap: (){b=3;checkList();},
              child: SizedBox(
                  width:  150 ,
                  height:  150 ,
                  child: Stack(
                    children: [
                      QuarterCircle(
                          circleAlignment: CircleAlignment.topLeft,
                          color:Colors.greenAccent),
                      Padding(
                        padding: const EdgeInsets.only(left:60.0,top: 60),
                        child: Text("6-9",style: TextStyle(
                            fontSize: 30,color: Colors.white
                        ),),
                      )
                    ],
                  ))
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10),
        ),
            RaisedButton(color: Colors.greenAccent,
                disabledColor: Colors.purple,splashColor: Colors.greenAccent,
              onPressed: (){setState(() {
                if(enabled==true){enabled=false;}
               else{enabled=true;}
              });},
              child:enabled? Text("AM"):Text("PM") ,
              ),
            Expanded(
              child: ListView.builder(
                  itemCount:a.length,
                  itemBuilder: (context,i) => Column(
                    children: [
                      Divider(height: 10,),
                      ListTile(
                        leading: CircleAvatar(
                          foregroundColor: Theme.of(context).primaryColor,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(a[i].avatarUrl),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(a[i].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),
                            Text(a[i].time,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14
                              ),),
                          ],
                        ),
                        subtitle: Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(a[i].message,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15
                            ),),
                        ),
                      )
                    ],
                  )
              ),
            )
      ]),
    ));
  }
}

