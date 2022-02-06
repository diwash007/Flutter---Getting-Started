import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.path,
      routes: {
        WelcomeScreen.path: (context) => const WelcomeScreen(),
        LoginScreen.path: (context) => const LoginScreen(),
        RegistrationScreen.path: (context) => const RegistrationScreen(),
        ChatScreen.path: (context) => const ChatScreen(),
      },
    );
  }
}
