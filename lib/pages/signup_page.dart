import 'package:flutter/material.dart';
import 'package:login_signup_page/pages/login_screen.dart';
import 'package:login_signup_page/widgets/textField_SignUp.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _usernameController1 = TextEditingController();
  TextEditingController _passwordController1 = TextEditingController();
  TextEditingController _confirmPasswordController1 = TextEditingController();
  String? _errorText1 = '';
  void setErrorMessage(String message) {
    setState(() {
      _errorText1 = message;
    });
  }

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
                  'Create Account',
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
                    userNameTextFieldSignUp(_usernameController1),
                    const SizedBox(height: 20),
                    passwordTextFieldSignUp('Password', _passwordController1),
                    const SizedBox(height: 20),
                    confirmPasswordTextFieldSignUp(
                        'Confirm Password', _confirmPasswordController1),
                    const SizedBox(height: 55),
                    SignUpButton(
                      'Sign Up',
                      context,
                      _usernameController1,
                      _passwordController1,
                      _confirmPasswordController1,
                      setErrorMessage,
                    ),
                    _errorText1 != null && _errorText1!.isNotEmpty
                        ? Text(
                            _errorText1!,
                            style: TextStyle(color: Colors.red),
                          )
                        : SizedBox.shrink(),
                    const SizedBox(
                      height: 160,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to sign up screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          'Already have an account? Sign In',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
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
