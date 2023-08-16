




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gulshshanedurood/user/login.dart';

import '../Validations.dart';
import '../database.dart';
import '../forgotpassword.dart';
import '../routes.dart';
import 'adminhome.dart';

class adminlogin extends StatefulWidget{
  @override
  State<adminlogin> createState() => _adminloginState();
}

class _adminloginState extends State<adminlogin> {
  var email=new TextEditingController(),password=new TextEditingController(),show_password=false;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Stack(children: [
          Image.asset('images/loginpattern.png',height: size.height*0.2,fit: BoxFit.fitWidth,),
          Center(child: Image.asset('images/logo.png',height: size.height*0.15,)),
          Padding(
            padding: EdgeInsets.only(top:  size.height*0.16),
            child: Center(
              child: Text('Admin',style: TextStyle(fontFamily: 'Poopins',fontSize: 22,fontWeight: FontWeight.w500,
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
                    controller: email,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      prefixIcon: Icon(Icons.mail),
                      fillColor: Colors.white,

                    ),
                  ),

                  SizedBox(height: 15,),
                  TextField(
                    controller: password,
                    obscureText: show_password,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      filled: true,
                      hintMaxLines: 1,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.vpn_key_sharp),
                      hintText: 'Password',
                      suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye),onPressed: (){
                        setState(() {
                          show_password=!show_password;
                        });
                      },),

                    ),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      TextButton(onPressed: (){
                        Navigator.push(context,Myroute(forgotpassword(user_type: 'admin',)));
                      }, child: Text('Forgot Password?')),
                    ],
                  ),


                  ElevatedButton(
                    onPressed: () async {
                      EasyLoading.show(status: 'processing');
                      if(email.text.isEmpty){
                        EasyLoading.showInfo('Email Required!');
                        return;
                      }
                      var s= Email_Validation(email.text);
                      if(s[1]==Colors.red){
                        EasyLoading.showInfo('${s[0]}');
                        return;
                      }


                      if(password.text.isEmpty){
                        EasyLoading.showInfo('Password Required!');
                        return;
                      }

                      var result=await    Login_admin(email: email.text,password: password.text);
                      if(result){
                        Set_Shared_Preference(email: email.text,password: password.text,user_type: 'admin');
                        Navigator.pushReplacement(context, Myroute(Admin_home ()));
                      }


                    },child: Text('Login'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text( 'Continue as user ? '),
                      TextButton(onPressed: (){
                        Navigator.push(context, Myroute(login_user()));
                      }, child:Text('Click Here'))
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
      ],),
    );
  }
}