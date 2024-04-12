import 'dart:async';

import 'package:flutter/material.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => MyHomePage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return
      Image.asset('Assets/images/imggg.png',height: double.infinity,width: double.infinity,fit: BoxFit.cover,);

  }
}