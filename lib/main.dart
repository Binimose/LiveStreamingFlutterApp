import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:livestreaming/firebase_options.dart';
import 'package:livestreaming/screens/home.dart';
import 'package:livestreaming/screens/loginpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LiveStreaming App',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     home:StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(), 
      
      builder: (
        BuildContext context, 
        AsyncSnapshot<User?> user) { 
          if(user.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          else if(user.hasData){
            return const HomePage();
          }
          else{
            return LoginPage();
          }
         }, 
      )
    );
  }
}

 
