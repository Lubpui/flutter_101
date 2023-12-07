// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // title
            Text(
              'LOsGIN',
              style: TextStyle(
                color: Colors.indigo[800],
                fontSize: 80,
                // fontWeight: FontWeight.bold,
                fontFamily: 'Noto Sans',
              ),
            )

            // text field

            //button

            //sign in with google
          ]),
        ),
      ),
    );
  }
}
