




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gulshanedurood/routes.dart';
import 'package:gulshanedurood/user/register.dart';



class forgotpassword extends StatefulWidget {
  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  var Otp_sent=false;

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
                Image.asset('images/loginpattern.png',height: size.height*0.2,fit: BoxFit.fitWidth,),
                Center(child: Image.asset('images/logo.png',height: size.height*0.15,)),
                Padding(
                  padding: EdgeInsets.only(top: size.height*0.16),
                  child: Center(
                    child: Text('Reset',style: TextStyle(fontFamily: 'Poopins',fontSize: 22,fontWeight: FontWeight.w500,
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
                        if(!Otp_sent)
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.mail),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: ElevatedButton(child: Text('Get Code'),onPressed: (){
                              setState(() {
                                Otp_sent=true;
                              });
                            },),

                          ),
                        ),
                        if(Otp_sent)
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            hintMaxLines: 1,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.sms),
                            hintText: 'OTP',


                          ),
                        ),
                        if(Otp_sent)
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            hintMaxLines: 1,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.vpn_key_sharp),
                            hintText: 'New Password',
                            suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye),onPressed: (){},),

                          ),
                        ),



                      if(Otp_sent)
                        ElevatedButton(
                          onPressed: (){},child: Text('Reset'),
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