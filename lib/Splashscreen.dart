

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gulshshanedurood/routes.dart';
import 'package:gulshshanedurood/user/home.dart';
import 'package:gulshshanedurood/user/login.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Validations.dart';


class Splashscreen extends StatefulWidget{
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  String latitude = '';
  String longitude = '';
  var usertype,location_details;
  Check_person() async {
    SharedPreferences pref =await SharedPreferences.getInstance();
    usertype=await pref.getString('usertype');

    if(usertype=='user'){
      Timer(Duration(seconds: 1),()=>Navigator.pushReplacement(context, Myroute(User_home())));
      return;
    }
    else{
      Timer(Duration(seconds: 1),()=>Navigator.pushReplacement(context, Myroute(login_user())));
      return;
    }

  }

  @override
  void initState() {
    super.initState();
    Customize_Easyloading();
    getLocation();
    Check_person();
  }


  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
          body:Stack(children: [
            Container(
              height: size.height*0.98,
              decoration: BoxDecoration(
                  color: Color(0xFF176C8C)
              ),
              child: Center(child:Image.asset('images/splashpattern.png'),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Transform.rotate(
                  angle:4.7,
                  child: Image.asset('images/toppattern.png',height: size.height*0.17,)),
                Image.asset('images/toppattern.png',height: size.height*0.17,),
            ],),
            Positioned(
              top: size.height*0.31,
                left: size.width*0.12,
                right: size.width*0.12,
                child: Center(child: Image.asset('images/splashlogo.png',height: size.height*0.26,))),

            Positioned(
                bottom: 0,
                child: Image.asset('images/splashmosque.png',height: size.height*0.18,))
          ],)
      ),
    );
  }


  getLocation() async {
    Location location = Location();

    try {
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          // Handle the case where location services are not enabled
          return;
        }
      }

      PermissionStatus permissionStatus = await location.hasPermission();
      if (permissionStatus == PermissionStatus.denied) {
        permissionStatus = await location.requestPermission();
        if (permissionStatus != PermissionStatus.granted) {
          // Handle the case where location permission is not granted
          return;
        }
      }

      LocationData locationData = await location.getLocation();
        latitude = locationData.latitude.toString();
        longitude = locationData.longitude.toString();
        print(longitude);
        Set_location(longitude: longitude,latitude: latitude);

    } catch (e) {
      print("Error: $e");
    }

  }

}


