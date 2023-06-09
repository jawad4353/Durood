

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gulshanedurood/routes.dart';
import 'package:gulshanedurood/user/login.dart';

class Splashscreen extends StatefulWidget{
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context, Myroute(login_user())));
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

 
}


