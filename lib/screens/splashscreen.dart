import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../styled_components.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      body: Hero(
        tag: 'Logo',
              child: Center(
          child: LogoStyle(),
        ),
      ),
    );
  }
}
