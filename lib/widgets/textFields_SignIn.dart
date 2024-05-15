import 'package:flutter/material.dart';

Widget userNameTextField(TextEditingController controller) {
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

Widget passwordTextField(String text, TextEditingController controller) {
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

Widget signInButton(
  String text,
  BuildContext context,
  Widget nextScreen,
  TextEditingController _usernameController,
  TextEditingController _passwordController,
  Function setErrorMessage,
) {
  return ElevatedButton(
    onPressed: () {
      if (_usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        print('Username: ${_usernameController.text}');
        print('Password: ${_passwordController.text}');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      } else {
        setErrorMessage('Please fill in all fields');
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
