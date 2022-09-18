import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xioamiode2code/screens/Checkout1.dart';
import 'package:xioamiode2code/widgets/CustomDropDown.dart';
import 'package:xioamiode2code/widgets/CustomDropDown2.dart';
import 'package:xioamiode2code/widgets/CustomMaterialButton.dart';
import 'package:xioamiode2code/widgets/CustomTextField.dart';

import '../constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreen();
}

class _CartScreen extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Constants.scaffoldBackgroundColor,
        elevation: 0,
        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 28),
        ),
        toolbarHeight: 70,
        titleSpacing: 20,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            List cart = [];
            if (snapshot.hasData) {
              cart = snapshot.data!.getStringList("cart") ?? [];
            }
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child: Column(
                children: [
                  snapshot.data != null
                      ? ListView.separated(
                          itemCount: cart.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                              color: Constants.textFieldBackgroundColor,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: Image.network(
                                      jsonDecode(cart[index])["image"],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(jsonDecode(cart[index])["name"],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          )),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                          "RAM: ${jsonDecode(cart[index])["ram"]}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          )),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                          "Storage: ${jsonDecode(cart[index])["storage"]}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          )),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                          "Color: ${jsonDecode(cart[index])["color"]}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          )),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                          "Serial Number: ${jsonDecode(cart[index])["psn"]}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          )),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                          "Quantity: ${jsonDecode(cart[index])["quantity"]}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: 12,
                          ),
                        )
                      : SizedBox(),
                  const SizedBox(height: 24),
                  cart.length > 0
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: CustomMaterialButton(
                              text: "Checkout",
                              onPressed: (() => Navigator.of(context).push(
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          const Checkout1())))))
                      : Center(
                          child: Text(
                            "No items in cart",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
