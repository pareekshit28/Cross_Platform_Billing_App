import 'package:flutter/material.dart';

import '../constants.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreen();
}

class _TrackOrderScreen extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Constants.scaffoldBackgroundColor,
        elevation: 0,
        title: const Text(
          "Track Order",
          style: TextStyle(fontSize: 28),
        ),
        toolbarHeight: 70,
        leadingWidth: 30,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Constants.textFieldBackgroundColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 16),
                  child: Row(
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
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Constants.textFieldBackgroundColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Expected Delivery: \nThursday",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                        const SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 8,
                              ),
                              Expanded(child: Divider(color: Colors.green)),
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 8,
                              ),
                              Expanded(child: Divider(color: Colors.green)),
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 8,
                              ),
                              Expanded(
                                  child:
                                      Divider(color: Constants.hintTextColor)),
                              CircleAvatar(
                                backgroundColor: Constants.hintTextColor,
                                radius: 8,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Order\nPlaced",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  )),
                              Text("Processing",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  )),
                              Text("Servicing\nDone",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  )),
                              Text("Out for \nDelivery",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  )),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Constants.textFieldBackgroundColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Delivery Address",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                      const SizedBox(
                        height: 6,
                      ),
                      Text("Manu Kumar Jain",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                      Text("1335, Indiranagar, Bangalore, Karnataka, 560038.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
