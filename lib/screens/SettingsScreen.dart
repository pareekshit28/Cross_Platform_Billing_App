import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xioamiode2code/screens/GateKeeper.dart';
import 'package:xioamiode2code/widgets/CustomMaterialButton.dart';

import '../constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Constants.scaffoldBackgroundColor,
          elevation: 0,
          title: const Text(
            "Settings",
            style: TextStyle(fontSize: 28),
          ),
          toolbarHeight: 70,
          titleSpacing: 20,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(children: [
                  MaterialButton(
                    height: 60,
                    onPressed: () async {
                      SharedPreferences.getInstance().then((prefs) {
                        prefs.clear().then((value) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => GateKeeper()),
                              (route) => false);
                        });
                      });
                    },
                    color: Colors.red,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Center(
                      child: Text(
                        "Sign Out",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ]))));
  }
}
