import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xioamiode2code/screens/CreateOrder2.dart';
import 'package:xioamiode2code/widgets/CustomDropDown.dart';
import 'package:xioamiode2code/widgets/CustomMaterialButton.dart';

import '../constants.dart';

class CreateOrder1 extends StatefulWidget {
  const CreateOrder1({Key? key}) : super(key: key);

  @override
  State<CreateOrder1> createState() => _CreateOrder1State();
}

class _CreateOrder1State extends State<CreateOrder1> {
  String? _category;
  Map? _product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Constants.scaffoldBackgroundColor,
        elevation: 0,
        title: const Text(
          "Create Order",
          style: TextStyle(fontSize: 28),
        ),
        toolbarHeight: 70,
        titleSpacing: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: Column(
          children: [
            CustomDropDown<String?>(
                value: _category,
                hint: "Select Category",
                items: const [
                  DropdownMenuItem<String>(
                    child: Text("Smartphones",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    value: "Smartphones",
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _category = value;
                  });
                }),
            const SizedBox(height: 12),
            CustomDropDown<Map?>(
                value: _product,
                hint: "Select Product",
                items: const [
                  DropdownMenuItem<Map>(
                    child: Text("Xioami 12S Ultra",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    value: {
                      "name": "Xioami 12S Ultra",
                      "image":
                          "https://fdn2.gsmarena.com/vv/bigpic/xiaomi-12s-ultra.jpg",
                      "price": 70690.00,
                    },
                  ),
                  DropdownMenuItem<Map>(
                    child: Text("Xioami Mix Fold 2",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    value: {
                      "name": "Xioami Mix Fold 2",
                      "image":
                          "https://www.91-img.com/pictures/148813-v2-xiaomi-mix-fold-2-5g-mobile-phone-large-1.jpg",
                      "price": 106990.00,
                    },
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _product = value;
                  });
                }),
            const SizedBox(height: 24),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: CustomMaterialButton(
                    text: "Next",
                    onPressed: (() {
                      if (_product != null) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => CreateOrder2(
                                  product: _product!,
                                )));
                      }
                    })))
          ],
        ),
      ),
    );
  }
}
