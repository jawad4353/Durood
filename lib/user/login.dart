




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gulshanedurood/forgotpassword.dart';
import 'package:gulshanedurood/routes.dart';
import 'package:gulshanedurood/user/register.dart';
import 'package:lottie/lottie.dart';

import 'home.dart';

class login_user extends StatefulWidget{
  @override
  State<login_user> createState() => _login_userState();
}

class _login_userState extends State<login_user> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
  return SafeArea(
    child: Scaffold(
        backgroundColor: Colors.white,
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
                  child: Text('Login',style: TextStyle(fontFamily: 'Poopins',fontSize: 22,fontWeight: FontWeight.w500,
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
                         hintText: 'Email',
                         filled: true,
                         prefixIcon: Icon(Icons.mail),
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


                    Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         TextButton(onPressed: (){
                           Navigator.push(context,Myroute(forgotpassword()));
                         }, child: Text('Forgot Password?')),
                       ],
                     ),


                    ElevatedButton(
                           onPressed: (){

                             Navigator.push(context, Myroute(User_home()));
                           },child: Text('Login'),
                         ),



                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text( 'Dont have account ? '),
                       TextButton(onPressed: (){
                         Navigator.push(context, Myroute(register_user()));
                       }, child:Text('Register'))
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