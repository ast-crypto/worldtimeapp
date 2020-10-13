import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

void saveSharedPref(String location, String url, String flag) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('l', location);
  prefs.setString('u', url);
  prefs.setString('f', flag);
}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),

  ];
  Map m;
  void updateTime(index) async{
    WorldTime temp = locations[index];
    await temp.getTime();

    //saveSharedPref(temp.location, temp.url, temp.flag);

    Navigator.pop(context, {'location':temp.location,
      'flag':temp.flag,
      'time':temp.time,
      'isDayTime':temp.isDayTime,});
  }

  @override
  Widget build(BuildContext context) {
    m = ModalRoute.of(context).settings.arguments;

    Future<bool> _onwillpop() {

      Navigator.pop(context, m);
        //return Future<bool>.value(true);

    }

    return WillPopScope(
      onWillPop: _onwillpop,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
            Icons.chevron_left),
            onPressed:(){return Navigator.pop(context, false);}
            ),
          title: Text('Select location'),
        ),
        body: ListView.builder(

          itemCount: locations.length,
          itemBuilder: (context,index){

            return Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}')),
              ),
            );

          }

        ),
      ),
    );
  }
}
