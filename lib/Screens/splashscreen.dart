import 'dart:async';
import 'package:flutter/material.dart';
import 'package:invoiceapp/Components/colors.dart';
import 'package:invoiceapp/Screens/homescreen.dart';
import 'package:invoiceapp/Screens/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Models/currentappuser.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CurrentAppUser.currentUserData.getCurrentUserData(user.uid);
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen())));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Image.asset("assets/images/elegance1.png"),
          )
        ],
      ),
    );
  }
}
