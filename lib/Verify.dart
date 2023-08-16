




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gulshshanedurood/routes.dart';
import 'package:gulshshanedurood/user/login.dart';
import 'package:lottie/lottie.dart';

import 'database.dart';


class Verify_OTP extends StatefulWidget {
  var data={};
  Verify_OTP({required this.data});
  @override
  State<Verify_OTP> createState() => _Verify_OTPState();
}

class _Verify_OTPState extends State<Verify_OTP> {
  var OTP_controller=new TextEditingController();
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
                          controller: OTP_controller,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: 'Enter Code',
                            filled: true,
                            prefixIcon: Icon(Icons.verified),
                            fillColor: Colors.white,

                          ),
                        ),





                        ElevatedButton(
                          onPressed: () async {
                            EasyLoading.show(status: 'Checking');
                            if(OTP_controller.text.isEmpty){
                              EasyLoading.showInfo('Enter OTP Code Sent to your email \n${widget.data['email']}');
                              return;
                            }

                            if(OTP_controller.text!=widget.data['otp']){
                              EasyLoading.showError('Incorrect OTP');
                              return;
                            }
                            EasyLoading.show(status: 'Registering');
                            if(OTP_controller.text==widget.data['otp']){
                              var result=await  Register_user(name: widget.data['name'],email: widget.data['email'],
                                  password: widget.data['password']);
                              if(result){
                                EasyLoading.dismiss();
                                Navigator.pushReplacement(context,Myroute(login_user()));
                              }
                            }
                          },child: Text('Verify'),
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