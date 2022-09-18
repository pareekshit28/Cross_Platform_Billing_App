import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xioamiode2code/screens/TrackOrderScreen.dart';

import '../constants.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreen();
}

class _OrdersScreen extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Constants.scaffoldBackgroundColor,
        elevation: 0,
        title: const Text(
          "Orders",
          style: TextStyle(fontSize: 28),
        ),
        toolbarHeight: 70,
        titleSpacing: 20,
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Image.network(
                            "https://fdn2.gsmarena.com/vv/bigpic/xiaomi-12s-ultra.jpg",
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Xioami 12S Ultra",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                )),
                            const SizedBox(
                              height: 12,
                            ),
                            Text("RAM: 12GB",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                )),
                            const SizedBox(
                              height: 6,
                            ),
                            Text("Storage: 256GB",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                )),
                            const SizedBox(
                              height: 6,
                            ),
                            Text("Color: Black",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                )),
                            const SizedBox(
                              height: 6,
                            ),
                            Text("Serial Number: 123456789",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                )),
                            const SizedBox(
                              height: 6,
                            ),
                            Text("Quantity: 1",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                )),
                            const SizedBox(
                              height: 6,
                            ),
                            Text("Order Date: 17/09/2021",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                )),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    MaterialButton(
                      height: 60,
                      onPressed: () => Navigator.of(context).push(
                          CupertinoPageRoute(
                              builder: (context) => const TrackOrderScreen())),
                      color: Constants.buttonColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Center(
                        child: Text(
                          "Track Order",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
