import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xioamiode2code/screens/PaymentScreen.dart';

import '../constants.dart';
import '../widgets/CustomMaterialButton.dart';

class OrderSummaryScreen extends StatelessWidget {
  final Map data;
  final String mode;
  final String address;
  const OrderSummaryScreen(
      {Key? key, required this.data, required this.mode, required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Constants.scaffoldBackgroundColor,
          elevation: 0,
          title: const Text(
            "Order Summary",
            style: TextStyle(fontSize: 28),
          ),
          toolbarHeight: 70,
          leadingWidth: 30,
        ),
        body: SingleChildScrollView(
          child: FutureBuilder<SharedPreferences>(
              future: SharedPreferences.getInstance(),
              builder: (context, snapshot) {
                List cart = [];
                if (snapshot.hasData) {
                  cart = snapshot.data!.getStringList("cart") ?? [];
                }
                num amount = 0;

                for (int i = 0; i < cart.length; i++) {
                  Map item = jsonDecode(cart[i]);
                  amount += item["price"] * item["quantity"];
                }
                amount = amount.truncateToDouble();
                num tax = (amount * 0.18).truncateToDouble();
                num total = (amount + tax).truncateToDouble();

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          "Items",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                              separatorBuilder:
                                  (BuildContext context, int index) => SizedBox(
                                height: 12,
                              ),
                            )
                          : SizedBox(),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          "Details",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Constants.textFieldBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Operator Id:  ${data["operatorId"]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              Text("Customer Name:  ${data["customerName"]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              Text("Customer Phone:  ${data["customerPhone"]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              Text("Customer Email:  ${data["customerEmail"]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              Text("Mode of Communication:  ${data["mode"]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              Text("Delivery Mode:  $mode",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              Text(
                                  "Delivery Address:  ${address == "" ? "NA" : address}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Constants.textFieldBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Cost:  Rs. $amount",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              Text("Taxes:  Rs. $tax",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              Text("Total Amount:  Rs. $total",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: CustomMaterialButton(
                                text: "Confirm",
                                onPressed: (() => Navigator.of(context).push(
                                    CupertinoPageRoute(
                                        builder: (context) => PaymentScreen(
                                            data: data,
                                            cart: cart,
                                            mode: mode,
                                            address: address,
                                            amount: total.toInt())))))),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                );
              }),
        ));
  }
}
