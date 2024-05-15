import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_page/pages/home_screen.dart';
import 'package:login_signup_page/pages/signup_page.dart';
import 'package:login_signup_page/widgets/textFields_SignIn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // NetworkController networkController = NetworkController();
  var _errorText;
  void setErrorMessage(String message) {
    setState(() {
      _errorText = message;
    });
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: Colors.white,
              child: const Center(
                child: Text(
                  'Welcome to the App!',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    userNameTextField(_userNameController),
                    const SizedBox(height: 20),
                    passwordTextField('Password', _passwordController),
                    const SizedBox(height: 25),
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text('Forgot Password?'),
                      ),
                    ),
                    const SizedBox(height: 30),
                    signInButton(
                        'Sign In',
                        context,
                        HomeScreen(),
                        _userNameController,
                        _passwordController,
                        setErrorMessage),
                    _errorText != null
                        ? Text(
                            _errorText,
                            style: const TextStyle(color: Colors.red),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 230,
                    ),
                    Center(
                        child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      ),
                      child: const Text(
                        'Don\'t have an account? Sign up',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
