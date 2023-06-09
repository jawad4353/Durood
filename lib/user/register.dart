












import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gulshanedurood/user/login.dart';

import '../Verify.dart';
import '../forgotpassword.dart';
import '../routes.dart';














class register_user extends StatefulWidget {
  @override
  State<register_user> createState() => _register_userState();
}

class _register_userState extends State<register_user> {
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
                  padding: EdgeInsets.only(top:  size.height*0.16),
                  child: Center(
                    child: Text('Register',style: TextStyle(fontFamily: 'Poopins',fontSize: 22,fontWeight: FontWeight.w500,
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
                            hintText: 'Name',
                            filled: true,
                            prefixIcon: Icon(Icons.person),
                            fillColor: Colors.white,

                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            filled: true,
                            prefixIcon: Icon(Icons.mail),
                            fillColor: Colors.white,

                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'City',
                            filled: true,
                            prefixIcon: Icon(Icons.house_siding),
                            fillColor: Colors.white,

                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Phone',
                            filled: true,
                            prefixIcon: Icon(Icons.call),
                            fillColor: Colors.white,

                          ),
                        ),

                        SizedBox(height: 15,),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            hintMaxLines: 1,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.vpn_key_sharp),
                            hintText: 'Password',
                            suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye),onPressed: (){},),

                          ),
                        ),


                        ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, Myroute(Verify_OTP()));
                          },child: Text('Register'),
                        ),



                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text( 'Already have account ? '),
                            TextButton(onPressed: (){
                              Navigator.pushReplacement(context, Myroute(login_user()));
                            }, child:Text('Login'))
                          ],),
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