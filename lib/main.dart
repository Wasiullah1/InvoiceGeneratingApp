import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/env/routes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      // home: TestScreen(),
      initialRoute: "/",
      getPages: AppRouting.ROUTES,
    ),
  );
}
