import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xioamiode2code/constants.dart';
import 'package:xioamiode2code/screens/MainScreen.dart';
import 'package:xioamiode2code/widgets/CustomTextField.dart';

import '../widgets/CustomMaterialButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              height: 100,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Sign in With your Mi Account",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextField(
                hintText: "Enter Mi ID", controller: _usernameController),
            SizedBox(
              height: 12,
            ),
            CustomTextField(
                hintText: "Enter Password", controller: _passwordController),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: CustomMaterialButton(
                text: "Sign In",
                onPressed: () async {
                  if (_usernameController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString("username", _usernameController.text);

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
