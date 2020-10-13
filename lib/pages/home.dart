import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgImage = data['isDayTime']?'day.png':'night.png';
    Color bgColor = data['isDayTime']?Colors.blue:Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
           decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)
           ),

           child: Padding(
              padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
               child: Column(

                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {
                        dynamic res = await Navigator.pushNamed(context, '/location',
                        arguments:{
                          'location':data['location'],
                          'flag':data['flag'],
                          'time':data['time'],
                          'isDayTime':data['isDayTime'],
                        }
                        );
                        setState(() {
                          data = res;
                        });
                      },
                      icon: Icon(Icons.edit_location, color: Colors.grey[300],),
                      label: Text(
                          'Edit Location',
                        style: TextStyle(color: Colors.grey[300]),
                      )
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.white
                      ),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(data['time'],
                   style: TextStyle(
                    fontSize: 65,
                    color: Colors.white
                   ),
                  )
                ],
               ),
           ),
        )
      )
    );
  }
}
