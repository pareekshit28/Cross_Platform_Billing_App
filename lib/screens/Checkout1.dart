import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xioamiode2code/screens/Checkout2.dart';
import 'package:xioamiode2code/widgets/CustomDropDown.dart';
import 'package:xioamiode2code/widgets/CustomTextField.dart';

import '../constants.dart';
import '../widgets/CustomMaterialButton.dart';

class Checkout1 extends StatefulWidget {
  const Checkout1({Key? key}) : super(key: key);

  @override
  State<Checkout1> createState() => _Checkout1State();
}

class _Checkout1State extends State<Checkout1> {
  final TextEditingController _operatorIdController = TextEditingController();
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _customerPhoneController =
      TextEditingController();
  final TextEditingController _customerEmailController =
      TextEditingController();
  String? _mode;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      _operatorIdController.text = value.getString("username") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Constants.scaffoldBackgroundColor,
        elevation: 0,
        title: const Text(
          "Checkout",
          style: TextStyle(fontSize: 28),
        ),
        toolbarHeight: 70,
        leadingWidth: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: Column(
          children: [
            CustomTextField(
                hintText: "Operator ID", controller: _operatorIdController),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
                hintText: "Customer Name", controller: _customerNameController),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
                hintText: "Customer Phone",
                controller: _customerPhoneController),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
                hintText: "Customer Email",
                controller: _customerEmailController),
            const SizedBox(
              height: 12,
            ),
            CustomDropDown<String?>(
                value: _mode,
                hint: "Mode of Communication",
                items: const <DropdownMenuItem<String>>[
                  DropdownMenuItem<String>(
                    child: Text("Email",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    value: "Email",
                  ),
                  DropdownMenuItem<String>(
                    child: Text("WhatsApp",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    value: "WhatsApp",
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _mode = value;
                  });
                }),
            const SizedBox(height: 24),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: CustomMaterialButton(
                    text: "Next",
                    onPressed: (() {
                      if (_operatorIdController.text.isNotEmpty &&
                          _customerNameController.text.isNotEmpty &&
                          _customerPhoneController.text.isNotEmpty &&
                          _customerEmailController.text.isNotEmpty &&
                          _mode != null) {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => Checkout2(
                                      data: {
                                        "operatorId":
                                            _operatorIdController.text,
                                        "customerName":
                                            _customerNameController.text,
                                        "customerPhone":
                                            _customerPhoneController.text,
                                        "customerEmail":
                                            _customerEmailController.text,
                                        "mode": _mode
                                      },
                                    )));
                      }
                    })))
          ],
        ),
      ),
    );
  }
}
