import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xioamiode2code/screens/LoginScreen.dart';
import 'package:xioamiode2code/screens/MainScreen.dart';

class GateKeeper extends StatefulWidget {
  const GateKeeper({Key? key}) : super(key: key);

  @override
  State<GateKeeper> createState() => _GateKeeperState();
}

class _GateKeeperState extends State<GateKeeper> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      value.getString("username") != null
          ? setState(() {
              _isLoggedIn = true;
            })
          : setState(() {
              _isLoggedIn = false;
            });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoggedIn ? MainScreen() : LoginScreen();
  }
}
