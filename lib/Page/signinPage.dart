import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradex/utils/signin.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 10,bottom: 30),
              child: Image(
                image: AssetImage("assets/logo.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: ElevatedButton.icon(
                onPressed: (){
                  final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
                  provider.googleLogin();
                }, 
                icon: const FaIcon(FontAwesomeIcons.google), 
                label: const Text("Sign In with Google")
              ),
            ),
          ],
        ),
      ),
    );
  }
}