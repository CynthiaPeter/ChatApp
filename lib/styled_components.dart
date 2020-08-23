import 'package:flutter/material.dart';

class LogoStyle extends StatelessWidget {
  const LogoStyle({this.size});

final int size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.message,
          size: 70.0,
          color: Color(0xFFEB1555),
        ),
        SizedBox(height: 5.0),
        Text(
          'Let\'s chat',
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: 40.0,
            fontFamily: 'Pacifico-Regular',
            color: Color(0xFFEB1555),
          ),
        ),
      ],
    );
  }
}



class RoundedButtonStyle extends StatelessWidget {
  RoundedButtonStyle({this.title, this.colour, this.onPressed});

final Color colour;
final String title;
final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      //padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            //Onclick on login, user gets navigated to signin.dart
            title,
            style: TextStyle( color: Colors.white, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
