import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logfire/google_signin.dart';
import 'package:provider/provider.dart';
import 'auth_google.dart';
import 'home.dart';
import 'login.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  // Widget build(BuildContext context) =>  ChangeNotifierProvider(
  //   create: (context) => GoogleSignInProvider(),
  //   child : MaterialApp(
  Widget build(BuildContext context) => MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red ,
      ),

      debugShowCheckedModeBanner: false,
    home: Login(),

    // )
  );
  }

