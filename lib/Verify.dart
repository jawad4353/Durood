




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gulshanedurood/forgotpassword.dart';
import 'package:gulshanedurood/routes.dart';
import 'package:gulshanedurood/user/register.dart';
import 'package:lottie/lottie.dart';


class Verify_OTP extends StatefulWidget {
  @override
  State<Verify_OTP> createState() => _Verify_OTPState();
}

class _Verify_OTPState extends State<Verify_OTP> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(

        body: Container(
          color:Colors.white ,
          child:ListView(
            children: [
              Stack(children: [
                Image.asset('images/loginpattern.png',height: size.height*0.25,fit: BoxFit.fitWidth,),
                Center(child: Image.asset('images/logo.png',height: size.height*0.2,)),
                Padding(
                  padding: EdgeInsets.only(top: size.height*0.22),
                  child: Center(
                    child: Text('Verify',style: TextStyle(fontFamily: 'Poopins',fontSize: 22,fontWeight: FontWeight.w500,
                        color: Color(0xFF176C8C)),),
                  ),
                ),
              ],),

              Stack(
                children: [
                  Container(height: size.height*0.71,),
                  Positioned(
                    top: size.height*0.05,
                    left: size.width*0.07,
                    right:size.width*0.07 ,
                    child: Container(
                      height: 500,
                      width: size.width*0.8,
                      child: ListView(children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Code',
                            filled: true,
                            prefixIcon: Icon(Icons.verified),
                            fillColor: Colors.white,

                          ),
                        ),





                        ElevatedButton(
                          onPressed: (){},child: Text('Verify'),
                        ),



                      ],),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 1,
                      right: 1,
                      child: Image.asset('images/Loginmosque.png'))

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}