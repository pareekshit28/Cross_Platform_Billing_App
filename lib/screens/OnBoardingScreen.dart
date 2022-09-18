import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xioamiode2code/widgets/CustomDropDown.dart';
import 'package:xioamiode2code/widgets/CustomMaterialButton.dart';
import 'package:xioamiode2code/widgets/CustomTextField.dart';
import '../constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final TextEditingController _storeNameController = TextEditingController();
  final TextEditingController _posController = TextEditingController();
  String? _store;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Constants.scaffoldBackgroundColor,
        elevation: 0,
        title: const Text(
          "Store Details",
          style: TextStyle(fontSize: 28),
        ),
        toolbarHeight: 70,
        titleSpacing: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomDropDown<String?>(
              value: _store,
              hint: "Select Store",
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem<String>(
                  child: Text("Store 1",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  value: "Store 1",
                ),
                DropdownMenuItem<String>(
                  child: Text("Store 2",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  value: "Store 2",
                ),
                DropdownMenuItem<String>(
                  child: Text("Store 3",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  value: "Store 3",
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _store = value;
                });
              },
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
                hintText: "Store Name", controller: _storeNameController),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(hintText: "POS ID", controller: _posController),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: CustomMaterialButton(
                text: "Next",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
