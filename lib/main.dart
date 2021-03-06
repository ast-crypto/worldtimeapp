import 'package:flutter/material.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/location.dart';
import 'package:worldtime/pages/loading.dart';

void main(){
  runApp(MaterialApp(
    initialRoute:  '/',
    routes: {
      '/' : (context){return Loading();},
      '/home' : (context){return Home();},
      '/location' : (context){return Location();},

    },
  ));
}