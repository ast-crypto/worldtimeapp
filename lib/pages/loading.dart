import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

/*Future<String> getSaved(String attr) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(attr);
}*/

class _LoadingState extends State<Loading> {



  void setUpWorldTime() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    
    WorldTime wt = WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location':wt.location,
      'flag':wt.flag,
      'time':wt.time,
      'isDayTime':wt.isDayTime,
      });
  }

  @override
  void initState(){
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
