import 'package:flutter/material.dart';
import 'package:login_signup_page/pages/home_screen.dart';

Widget userNameTextFieldSignUp(TextEditingController controller) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      border: Border.all(color: Colors.white, width: 2.0),
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: 'Username',
          prefixIcon: Icon(Icons.person),
          border: InputBorder.none),
    ),
  );
}

Widget passwordTextFieldSignUp(String text, TextEditingController controller) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      border: Border.all(color: Colors.white, width: 2.0),
    ),
    child: TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
          labelText: text,
          prefixIcon: Icon(Icons.lock),
          border: InputBorder.none),
    ),
  );
}

Widget confirmPasswordTextFieldSignUp(
    String text, TextEditingController controller) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      border: Border.all(color: Colors.white, width: 2.0),
    ),
    child: TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
          labelText: text,
          prefixIcon: Icon(Icons.lock),
          border: InputBorder.none),
    ),
  );
}

Widget SignUpButton(
  String text,
  BuildContext context,
  TextEditingController _usernameController,
  TextEditingController _passwordController,
  TextEditingController _confirmPasswordController,
  setErrorText,
) {
  return ElevatedButton(
    onPressed: () {
      if (_usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty) {
        if (_passwordController.text == _confirmPasswordController.text) {
          print('Sign Up Successful');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          setErrorText('Passwords do not match');
        }
      } else {
        setErrorText('Please fill in all fields');
      }
    },
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        letterSpacing: 1.5,
        color: Colors.black,
      ),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      padding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
  );
}
