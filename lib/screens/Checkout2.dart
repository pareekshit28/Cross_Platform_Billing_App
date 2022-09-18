import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xioamiode2code/screens/OrderSummaryScreen.dart';
import 'package:xioamiode2code/widgets/CustomDropDown.dart';
import 'package:xioamiode2code/widgets/CustomTextField.dart';
import '../constants.dart';
import '../widgets/CustomMaterialButton.dart';

class Checkout2 extends StatefulWidget {
  final Map data;
  const Checkout2({Key? key, required this.data}) : super(key: key);

  @override
  State<Checkout2> createState() => _Checkout2State();
}

class _Checkout2State extends State<Checkout2> {
  final TextEditingController _addressController = TextEditingController();
  String? _mode;
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
            CustomDropDown<String?>(
                value: _mode,
                hint: "Delivery Mode",
                items: const [
                  DropdownMenuItem(
                    child: Text("Pickup",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    value: "Pickup",
                  ),
                  DropdownMenuItem(
                    child: Text("Delivery",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    value: "Delivery",
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _mode = value;
                  });
                }),
            _mode == "Delivery"
                ? const SizedBox(
                    height: 12,
                  )
                : SizedBox(),
            _mode == "Delivery"
                ? CustomTextField(
                    hintText: "Custom Address",
                    controller: _addressController,
                    maxLines: 6,
                  )
                : SizedBox(),
            const SizedBox(height: 24),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: CustomMaterialButton(
                    text: "Next",
                    onPressed: (() {
                      if (_mode != null) {
                        if (_mode == "Delivery" &&
                            _addressController.text.isNotEmpty) {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => OrderSummaryScreen(
                                        data: widget.data,
                                        mode: _mode!,
                                        address: _addressController.text,
                                      )));
                        }
                      }
                    })))
          ],
        ),
      ),
    );
  }
}
