import 'package:flutter/material.dart';
import 'package:wucommerce/screens/homepage_screen.dart';
import 'package:wucommerce/signInandUp/loginpage_screen.dart';
import 'package:wucommerce/signInandUp/registerpage_screen.dart';

class WelcomebackScreen extends StatefulWidget {
  @override
  State<WelcomebackScreen> createState() => _welcomebackscreen();
}

class _welcomebackscreen extends State<WelcomebackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Welcomeback!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Loginpagescreen()), // Navigate to SecondPage
                );// Navigate to Login Page
              },
              child: Text("Login"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterpageScreen()), // Navigate to SecondPage
                );// Navigate to Register Page
              },
              child: Text("Register"),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomepageScreen()), // Navigate to SecondPage
                );
              },
              child: Text("Continue as Guest",),
            ),
          ],
        ),
      ),
    );
  }
}
