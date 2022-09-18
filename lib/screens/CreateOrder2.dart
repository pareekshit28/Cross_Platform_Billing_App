import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xioamiode2code/screens/MainScreen.dart';
import 'package:xioamiode2code/widgets/CustomDropDown.dart';
import 'package:xioamiode2code/widgets/CustomDropDown2.dart';
import 'package:xioamiode2code/widgets/CustomMaterialButton.dart';
import 'package:xioamiode2code/widgets/CustomTextField.dart';

import '../constants.dart';

class CreateOrder2 extends StatefulWidget {
  final Map product;
  const CreateOrder2({Key? key, required this.product}) : super(key: key);

  @override
  State<CreateOrder2> createState() => _CreateOrder2State();
}

class _CreateOrder2State extends State<CreateOrder2> {
  String? _ram;
  String? _storage;
  String? _color;
  int _quantity = 1;
  final TextEditingController _psnController =
      TextEditingController(text: "123456789");

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
        leadingWidth: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Constants.textFieldBackgroundColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Image.network(
                        widget.product["image"],
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      children: [
                        Text(widget.product["name"],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            )),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: CustomDropDown2<String?>(
                              value: _ram,
                              hint: "RAM",
                              items: const <DropdownMenuItem<String>>[
                                DropdownMenuItem<String>(
                                  child: Text("6GB",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                  value: "6GB",
                                ),
                                DropdownMenuItem<String>(
                                  child: Text("8GB",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                  value: "8GB",
                                ),
                                DropdownMenuItem<String>(
                                  child: Text("12GB",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                  value: "12GB",
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _ram = value;
                                });
                              }),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: CustomDropDown2<String?>(
                              value: _storage,
                              hint: "Storage",
                              items: const <DropdownMenuItem<String>>[
                                DropdownMenuItem<String>(
                                  child: Text("128GB",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                  value: "128GB",
                                ),
                                DropdownMenuItem<String>(
                                  child: Text("256GB",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                  value: "256GB",
                                ),
                                DropdownMenuItem<String>(
                                  child: Text("512GB",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                  value: "512GB",
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _storage = value;
                                });
                              }),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: CustomDropDown2<String?>(
                              value: _color,
                              hint: "Colour",
                              items: const <DropdownMenuItem<String>>[
                                DropdownMenuItem<String>(
                                  child: Text("Black",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                  value: "Black",
                                ),
                                DropdownMenuItem<String>(
                                  child: Text("White",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                  value: "White",
                                ),
                                DropdownMenuItem<String>(
                                  child: Text("Blue",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                  value: "Blue",
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _color = value;
                                });
                              }),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text("Quantity",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                )),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                if (_quantity > 1) {
                                  setState(() {
                                    _quantity--;
                                  });
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 13.0),
                                child: Text("_",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Constants.scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(_quantity.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _quantity = _quantity + 1;
                                });
                              },
                              child: Text("+",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  )),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            CustomTextField(
                hintText: "Product Serial Number", controller: _psnController),
            const SizedBox(height: 24),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: CustomMaterialButton(
                    text: "Add to Cart",
                    onPressed: (() async {
                      if (_ram != null && _storage != null && _color != null) {
                        final cartItem = {
                          "name": widget.product["name"],
                          "image": widget.product["image"],
                          "ram": _ram,
                          "storage": _storage,
                          "color": _color,
                          "quantity": _quantity,
                          "psn": _psnController.text,
                          "price": widget.product["price"],
                        };
                        final prefs = await SharedPreferences.getInstance();
                        final cart = prefs.getStringList("cart");
                        if (cart != null) {
                          cart.add(jsonEncode(cartItem));
                          await prefs.setStringList("cart", cart);
                        } else {
                          await prefs
                              .setStringList("cart", [jsonEncode(cartItem)]);
                        }
                        Navigator.of(context).pushAndRemoveUntil(
                            CupertinoPageRoute(
                                builder: (context) => MainScreen()),
                            (route) => false);
                      }
                    })))
          ],
        ),
      ),
    );
  }
}
