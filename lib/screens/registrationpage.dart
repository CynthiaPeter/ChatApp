import 'package:chat_app/screens/chatpage.dart';
import 'package:flutter/material.dart';

import '../constant_styles.dart';
import '../styled_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registrationpage';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
bool showSpinner = false;
  String name;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
              child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: [
                  Icon(
                    Icons.message,
                    size: 70,
                    color: Color(0xFFEB1555),
                  ),
                  Text(
                    'Let\'s chat',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFEB1555),
                        fontFamily: 'Pacifico-Regular'),
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  name = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your Fullname',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButtonStyle(
                title: 'Sign Up',
                colour: Color(0xFFeb1555),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                        if (newUser != null){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(),),);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                  } 
                  catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
          ],),
        ),
      ),
    );
  }
}
