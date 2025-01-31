import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:invoiceapp/Components/button.dart';
import 'package:invoiceapp/Components/colors.dart';
import 'package:invoiceapp/Models/appuser.dart';
import 'package:invoiceapp/Screens/loginscreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  static const String id = '/signup';
  String username = "", email = "", password = "", contact = "";
  bool load = false;
  bool showSpinner = false;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController contactcontroller = TextEditingController();

  final _auth = FirebaseAuth.instance;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 70.0, left: 50.0, right: 50, bottom: 30),
                  child: Image.asset("assets/images/elegance1.png"),
                ),
                Text("Sign up",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 35.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: namecontroller,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'required';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: 'Username',
                              labelText: 'Username',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // hintStyle: TextStyle(
                              //   color: AppColors.hintColor,
                              //   fontWeight: FontWeight.normal,
                              // ),
                              // labelStyle: TextStyle(
                              //     color: AppColors.hintColor,
                              //     fontWeight: FontWeight.normal)
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: emailcontroller,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'required';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintText: 'Emai',
                              labelText: 'Email',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: passwordcontroller,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'required';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Password',
                              labelText: 'Password',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: contactcontroller,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Provide Contact in +92 format required';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              hintText: 'Contact',
                              labelText: 'Contact',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70.0, vertical: 5),
                  child: Button(
                      title: "Sign up",
                      onPress: () async {
                        await signUp(emailcontroller.text.toString(),
                            passwordcontroller.text.toString());
                      }),
                ),

                // SizedBox(height: 10),
                // Text('Or create account using social media',
                //     style: TextStyle(
                //         fontSize: 15,
                //         color: Theme.of(context).colorScheme.onBackground)),
                // SizedBox(height: 10),
                // const SocialIconButton(),
              ]),
        ));
  }

  Future<void> signUp(String email, String password) async {
    print('111 ${emailcontroller.text}');
    print('111 ${namecontroller.text}');
    print('111 ${passwordcontroller.text}');
    print('111 ${contactcontroller.text}');
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    AppUser userModel = AppUser();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = namecontroller.text;
    userModel.phone = contactcontroller.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(AppUser.toMap(userModel));
    Fluttertoast.showToast(msg: "Account created successfully");
    Navigator.push((context),
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
