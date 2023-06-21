import 'package:flutter/material.dart';
import 'package:sign_in_with_google/screens/home.dart';
import 'package:sign_in_with_google/services/firebase_services.dart';
import 'package:sign_in_with_google/utils/colors_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
          )
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              onPressed: () async{
                await firebaseServices().signInWithGoogle();
                Navigator.push(context,MaterialPageRoute(builder: (context)=> HomeScreen()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)){
                    return Colors.black26;
                  }
                  return Colors.white;
                })
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/google.png",
                      width:40,
                      height: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Login with Google",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                        ),
                      )
                    ],
                  ),
                  ),
                ),
            ),
          ),
        ),
      ),
    );
  }
}