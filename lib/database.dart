

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';



Future<bool> Register_user({required email,required password,required name}) async {
  try{
    var s= FirebaseFirestore.instance.collection('users').doc(email);
    s.set({'email':"${email}",'password':'${password}','name':'${name}','date':'${DateTime.now()}'});
    EasyLoading.showSuccess('Account created Sucessfully  ');
    return true;
  }
  catch(e){
    EasyLoading.showError('! Account has not been created.');
    return false;
  }
}


Email_Duplicacy( {required password,required email}) async {
  var s=false,email_exist;
  await FirebaseFirestore.instance.collection("users").get().then((querySnapshot) {
    querySnapshot.docs.forEach((result) {
      if(  result.data()['email']==email ){
        EasyLoading.showError('Duplicate Email .This email ${email} already registered .');
        s=true;
      }
    });
  });
  return await s;
}



Login_user( {required password,required email}) async {
  var s=false,email_exist;
  await FirebaseFirestore.instance.collection("users").get().then((querySnapshot) {
    querySnapshot.docs.forEach((result) {
      if( result.data()['password']==password && result.data()['email']==email ){
        EasyLoading.showSuccess('Success');
        s=true;
      }
      else{
        s=false;
        email_exist=result.data()['email']==email;
        if(email_exist==false){
          EasyLoading.showError('Email not registered.\n${email}');
        }
        else{
          EasyLoading.showError('Incorrect Password');
        }
      }
    });
  });
  return await s;
}


Login_admin( {required password,required email}) async {
  var s=false,email_exist;
  await FirebaseFirestore.instance.collection("admin").get().then((querySnapshot) {
    querySnapshot.docs.forEach((result) {
      if( result.data()['password']==password && result.data()['email']==email ){
        EasyLoading.showSuccess('Success');
        s=true;
      }
      else{
        s=false;
        email_exist=result.data()['email']==email;
        if(email_exist==false){
          EasyLoading.showError('Email not registered.\n${email}');
        }
        else{
          EasyLoading.showError('Incorrect Password');
        }
      }
    });
  });
  return await s;
}
