












import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gulshshanedurood/main.dart';

import '../Validations.dart';
import '../Verify.dart';
import '../database.dart';
import '../forgotpassword.dart';
import '../routes.dart';
import 'login.dart';














class register_user extends StatefulWidget {
  @override
  State<register_user> createState() => _register_userState();
}

class _register_userState extends State<register_user> {
  var email=new TextEditingController(),password=new TextEditingController(),name=new TextEditingController(),
      Name_error,Name_error_color=Colors.grey, Email_error,Email_error_color=Colors.grey,Password_error,
      Password_error_color=Colors.grey;

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
                          controller: name,
                          keyboardType: TextInputType.visiblePassword,
                          inputFormatters: [  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z - ]')),],
                          onChanged: (a){
                            if(a.isEmpty){
                              return;
                            }
                            else if(a.replaceAll(' ', '').length<2){
                              setState(() {
                                Name_error='Name Must have Two letters';
                                Name_error_color=Colors.red;
                                return;
                              });
                            }
                            else if(a.replaceAll(' ', '').length>=2){
                              setState(() {
                                Name_error='Valid name';
                                Name_error_color=myPrimaryColor;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Name',
                            filled: true,
                            prefixIcon: Icon(Icons.person),
                            fillColor: Colors.white,
                            errorText: Name_error,
                            errorStyle: TextStyle(color:Name_error_color )
                              ,
                            focusedErrorBorder:UnderlineInputBorder(borderSide: BorderSide(color: Name_error_color))  ,
                            focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Name_error_color)) ,
                            enabledBorder:UnderlineInputBorder(borderSide: BorderSide(color: Name_error_color))  ,
                            errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Name_error_color)) ,

                          ),
                        ),
                        TextField(
                          controller: email,
                          keyboardType: TextInputType.visiblePassword,
                          inputFormatters: [  FilteringTextInputFormatter.allow(RegExp(r'[0-9a-zA-Z.-.@-@_-_]')),],
                          onChanged: (a){
                            setState(() {
                              var s=Email_Validation(a);
                              Email_error=s[0];
                              Email_error_color=s[1];
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Email',
                            filled: true,
                            prefixIcon: Icon(Icons.mail),
                            fillColor: Colors.white,
                            errorText: Email_error,
                            errorStyle: TextStyle(color:Email_error_color )
                            ,
                            focusedErrorBorder:UnderlineInputBorder(borderSide: BorderSide(color: Email_error_color))  ,
                            focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color:  Email_error_color)) ,
                            enabledBorder:UnderlineInputBorder(borderSide: BorderSide(color:  Email_error_color))  ,
                            errorBorder: UnderlineInputBorder(borderSide: BorderSide(color:  Email_error_color)) ,
                          ),
                        ),


                        SizedBox(height: 15,),
                        TextField(
                          controller: password,
                          keyboardType: TextInputType.visiblePassword,

                        onChanged: (a){
                          setState(() {
                            var s=Password_Validation(a);
                            Password_error=s[0];
                            Password_error_color=s[1];

                          });
                        },
                          decoration: InputDecoration(
                            filled: true,
                            hintMaxLines: 1,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.vpn_key_sharp),
                            hintText: 'Password',
                            suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye),onPressed: (){},),
                            errorText: Password_error,
                            errorStyle: TextStyle(color:Password_error_color )
                            ,
                            focusedErrorBorder:UnderlineInputBorder(borderSide: BorderSide(color: Password_error_color))  ,
                            focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color:  Password_error_color)) ,
                            enabledBorder:UnderlineInputBorder(borderSide: BorderSide(color:  Password_error_color))  ,
                            errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Password_error_color)) ,
                          ),
                          ),



                        ElevatedButton(
                          onPressed: () async {
                            var dataa={};
                            EasyLoading.show(status: 'processing');
                            if(name.text.isEmpty){
                              EasyLoading.showInfo('Name Required!');
                              return;
                            }
                            if(name.text.replaceAll(' ', '').length<2){
                              EasyLoading.showInfo('Name Must have two characters!');
                              return;
                            }
                            if(email.text.isEmpty){
                              EasyLoading.showInfo('Email Required!');
                              return;
                            }
                            var s= Email_Validation(email.text);
                            if(s[1]==Colors.red){
                              EasyLoading.showInfo('${s[0]}');
                              return;
                            }
                            var otpq=Generate_OTP();

                            if(password.text.isEmpty){
                              EasyLoading.showInfo('Password Required!');
                              return;
                            }
                            var s1=Password_Validation(password.text);
                            if(s1[1]== Colors.red){
                              EasyLoading.showInfo('${s1[0]}');
                              return;
                            }
                         var result=await Email_Duplicacy(email:email.text,password:password.text);

                            dataa['name']=name.text;
                            dataa['email']=email.text;
                            dataa['password']=password.text;
                            dataa['otp']=otpq;
                            if(!result){
                              EasyLoading.dismiss();
                               var s=Send_mail(name: name.text,receiver_email: email.text, OTP:otpq);

                             print(dataa);
                              Navigator.push(context, Myroute(Verify_OTP(data: dataa)));
                            }


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