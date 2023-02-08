import 'dart:async';

import 'package:final_project/screens/login.view.dart';
import 'package:final_project/utils/global.colors.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LoginView())));
    return Scaffold(
      backgroundColor: GlobalColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/Logo.png"),
            Text(
              'VIVA.',
              style: TextStyle(
                color: GlobalColors.primaryMainColor,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // child: Image.asset("assets/images/Logo.png"),
        // child: Text(
        //   'VIVA.',
        //   style: TextStyle(
        //     color: GlobalColors.primaryMainColor,
        //     fontSize: 35,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ),
    );
  }
}
