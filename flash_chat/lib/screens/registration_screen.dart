import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import '../components/rounded_button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static const String path = '/register';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: textFieldDecoration,
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: textFieldDecoration.copyWith(
                    hintText: 'Enter your password')),
            const SizedBox(
              height: 24.0,
            ),
            Hero(
              tag: 'register',
              child: RoundedButton(
                color: Colors.blueAccent,
                title: 'Register',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
