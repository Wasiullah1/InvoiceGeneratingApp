import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:invoiceapp/Components/button.dart';
import 'package:invoiceapp/Models/currentappuser.dart';
import 'package:invoiceapp/Screens/loginscreen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? name;
  String? email;
  @override
  void initState() {
    super.initState();
    name = CurrentAppUser.currentUserData.name ?? "";
    email = CurrentAppUser.currentUserData.email ?? "";
    setState(() {});
  }

  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            color: Colors.blue.shade100,
            child: Column(children: [
              SizedBox(height: 20),
              Container(
                // height: MediaQuery.of(context).size.height * .3,
                // width: MediaQuery.of(context).size.width * .3,

                child: CircleAvatar(
                  backgroundColor: Colors.black,
                ),
                width: 100,
                height: 100,
              ),
              SizedBox(height: 10),
              Text(
                " $name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: 10),
              Text(
                "$email",
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
            ]),
          )),
      ListTile(
        leading: Icon(
          Icons.home,
        ),
        title: const Text('Home'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      // ListTile(
      //   leading: Icon(
      //     Icons.person,
      //   ),
      //   title: const Text('Profile'),
      //   onTap: () {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => ProfileScreen()));
      //   },
      // ),
      ListTile(
        leading: Icon(
          Icons.settings,
        ),
        title: const Text('Settings'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 300,
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Button(
            title: "Logout",
            onPress: () async {
              await logout(context);
            },
          ),
        ),
      ),
    ]));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
