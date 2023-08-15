




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gulshshanedurood/Validations.dart';
import 'package:gulshshanedurood/routes.dart';
import 'package:gulshshanedurood/user/login.dart';




class forgotpassword extends StatefulWidget {
  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  var Otp_sent=false,email=new TextEditingController(),password=new TextEditingController(),
  otp=new TextEditingController(),OTP,Name;

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
                          controller:email,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.mail),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: ElevatedButton(child: Text('Get Code'),onPressed: () async {

                                EasyLoading.show(status: 'Checking info');
                                if(email.text.isEmpty){
                                  EasyLoading.showInfo('Email required');
                                  return;
                                }

                                OTP=Generate_OTP();
                                await FirebaseFirestore.instance.collection("users").get().then((querySnapshot) {
                                  querySnapshot.docs.forEach((result) {
                                    if(  result.data()['email']==email.text ){
                                      Name=result.data()['name'];
                                    }

                                  });
                                });
                                if(Name==null){
                                  EasyLoading.showInfo('Email not registered');
                                  return;
                                }
                                Send_mail(name: Name, OTP: OTP, receiver_email: email.text);
                                EasyLoading.showSuccess('OTP code sent to your email');
                            setState(() {
                              Otp_sent=true;
                            });
                            },),

                          ),
                        ),
                        if(Otp_sent)
                        TextField(
                          controller:otp,
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
                          controller:password,
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
                          onPressed: () async {
                            EasyLoading.show(status: 'processing');
                            if(otp.text.isEmpty){
                              EasyLoading.showInfo('Enter OTP code sent to your email');
                              return;
                            }
                            if(otp.text!=OTP){
                              EasyLoading.showInfo('Incorrect OTP');
                              return;
                            }
                            if(password.text.isEmpty){
                              EasyLoading.showInfo('Enter new password');
                              return;
                            }
                            var result=Password_Validation(password.text);
                            if(result[1]==Colors.red){
                              EasyLoading.showInfo('${result[0]}');
                              return;
                            }
                           try{
                            await FirebaseFirestore.instance.collection("users").doc(email.text).update({'password':password.text}).whenComplete(() => EasyLoading.showSuccess('Password Updated '));

                           }
                            catch(e){
                              EasyLoading.showError('Error Updating Password');
                              return;
                            }
                            Navigator.pushReplacement(context, Myroute(login_user()));


                          },child: Text('Reset'),
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