import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/rounded_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String path = '/';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      // upperBound: 100.0,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();

    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText(
                    'Flash Chat',
                    speed: const Duration(milliseconds: 100),
                    textStyle: const TextStyle(
                      fontSize: 45.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ]),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Hero(
              tag: 'login',
              child: RoundedButton(
                color: Colors.lightBlueAccent,
                title: 'Log In',
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.path);
                },
              ),
            ),
            Hero(
              tag: 'register',
              child: RoundedButton(
                color: Colors.blueAccent,
                title: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.path);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
