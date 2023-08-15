


import 'dart:convert';
import 'dart:math';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gulshshanedurood/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


Future<void> Set_Shared_Preference({required user_type,required email,required password}) async {
  SharedPreferences pref =await SharedPreferences.getInstance();
  await pref.setString("email", "${email}");
  await pref.setString("password", "${password}");
  await pref.setString("usertype", user_type);
}


Future<void> Set_location({required longitude,required latitude}) async {
  SharedPreferences pref =await SharedPreferences.getInstance();
  await pref.setString("longitude", "${longitude}");
  await pref.setString("latitude", "${latitude}");
}

 Get_latitude() async {
  SharedPreferences pref =await SharedPreferences.getInstance();
  await pref.get('latitude');
}

Get_longitude() async {
  SharedPreferences pref =await SharedPreferences.getInstance();
  await pref.get('longitude');
}
Get_Shared_Preference() async {
  SharedPreferences pref =await SharedPreferences.getInstance();
  return await pref.getString("email") ;
}



Clear_Preferences() async {
  SharedPreferences pref =await SharedPreferences.getInstance();
  pref.clear();
}

bool Validate_Email(email){
  String  pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(email);
}

bool Validate_Password(String password){
  String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(password) ;
}


List Email_Validation(a){
  var mylist=[],is_valid_email;
  if(a.isEmpty){
    mylist.add(null);
    mylist.add(Colors.grey);
    return mylist;
  }
  is_valid_email=EmailValidator.validate(a);
  if(!is_valid_email) {
    mylist.add('Invalid Email');
    mylist.add(Colors.red);
    return mylist;
  }

  if(!'${a}'.endsWith('.com')  ) {
    mylist.add('Invalid Email');
    mylist.add(Colors.red);
    return mylist;
  }

  mylist.add('Valid Email');
  mylist.add(myPrimaryColor);
  return mylist;


}



List Password_Validation(a){
  var mylist=[],is_valid_email;
  if(a.isEmpty){
    mylist.add(null);
    mylist.add(Colors.grey);
    return mylist;
  }

  if(!Validate_Password(a)) {
    mylist.add('Password must have length 8,one upper & lowercase,\ndigit,specialchar');
    mylist.add(Colors.red);
    return mylist;
  }
  if(a.length>16){
    mylist.add('Password length should not exceed 15');
    mylist.add(Colors.red);
    return mylist;
  }

  mylist.add('Valid password');
  mylist.add(myPrimaryColor);
  return mylist;


}






 Generate_OTP(){
  var ABC=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q',
    'R','S','T','U','V','W','X','Y','Z'
  ],abc=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p',
  'q','r','s','t','u','v','w','x','y','z'
  ];
  Random a=new Random();
  var random_number=a.nextInt(999999);
  var capital_alphabet=ABC[a.nextInt(ABC.length-1)];
  var capital_alphabet1=ABC[a.nextInt(ABC.length-1)];
  var small_alphabet=abc[a.nextInt(ABC.length-1)];
  return '${capital_alphabet1+small_alphabet+random_number.toString()+capital_alphabet}';
}







Future<void> Send_mail({required name,required OTP,required receiver_email}) async {
  print(OTP);
  print('ji');
  var
      Service_id='service_3zv9w2k',
      Template_id='template_qnoxo5q',
      User_id='fiwZgGVqYdR7QYE9g';
  var s= await http.post(Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
      headers: {
        'origin':'http:localhost',
        'Content-Type':'application/json'
      },
      body: jsonEncode({
        'service_id':Service_id,
        'user_id':User_id,
        'template_id':Template_id,
        'template_params':{
          'name':name,
          'receiver':receiver_email,
          'otp':OTP

        }
      })
  ).onError((error, stackTrace) => jd());


}
jd(){
  EasyLoading.showError('OTP Code Not Sent !');
}

