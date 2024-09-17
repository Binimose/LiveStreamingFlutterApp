import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:livestreaming/utils/util.dart';

class AuthMethods{
  FirebaseAuth auth = FirebaseAuth.instance;
Future<String> signUp({required username,required email,required password}) async {

username = username.trim();
email = email.trim();
password = password.trim();

String output = 'Sothing went wrong';
if(username.isNotEmpty && email.isNotEmpty && password.isNotEmpty){

  try{
       await auth.createUserWithEmailAndPassword(email: email, password: password);
       output = 'Success';
  }catch(e){
    output = e.toString();

  }

}
return output;

}

Future<String> signin({required email,required password}) async {

 
email = email.trim();
password = password.trim();

String output = 'Sothing went wrong';
if( email.isNotEmpty && password.isNotEmpty){

  try{
       await auth.signInWithEmailAndPassword(email: email, password: password);
       output = 'Success';
  }catch(e){
    output = e.toString();

  }

}
return output;

}

 

Future<String> signInWithGoogle(BuildContext context) async {
 String output = 'Error on Signing with google';
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

   
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  UserCredential userCredentioal = await auth.signInWithCredential(credential);

  User? user = userCredentioal.user;

  try{if(userCredentioal.additionalUserInfo!.isNewUser){
    if(user != null){
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'username':user.displayName,
        'uid':user.uid,
        'profilePicture':user.photoURL
      });
    }


  }


   output =  'Success';
   
} on FirebaseAuthException  catch(e){
   
  output = e.toString();
  
ShowSnackBar(context, e.message!);

}
return output;
  
}
}