import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:xioamiode2code/screens/PaymentStatus.dart';

import '../constants.dart';

class PaymentScreen extends StatefulWidget {
  final List cart;
  final Map data;
  final String mode;
  final String address;
  final int amount;
  const PaymentScreen(
      {Key? key,
      required this.amount,
      required this.data,
      required this.mode,
      required this.address,
      required this.cart})
      : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    _onPaymentSuccess();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.white),
          SizedBox(width: 10),
          Text("Payment failed, Please try again",
              style: TextStyle(color: Colors.white)),
        ],
      ),
    ));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet");
    print(response);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Constants.scaffoldBackgroundColor,
          elevation: 0,
          title: const Text(
            "Payment",
            style: TextStyle(fontSize: 28),
          ),
          toolbarHeight: 70,
          leadingWidth: 30,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
          child: Column(children: [
            MaterialButton(
              height: 60,
              onPressed: () {
                if (Platform.isAndroid || Platform.isIOS) {
                  _razorpay.open({
                    "key": "rzp_test_ZsMlH7E0L8jUTO",
                    "amount": widget.amount * 100,
                    "name": "Mi Store",
                    "description": "Payment for service",
                  });
                }
              },
              color: Constants.textFieldBackgroundColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Text(
                      "Cards/ Net Banking/ UPI",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Spacer(),
                    Icon(
                      CupertinoIcons.chevron_right,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            MaterialButton(
              height: 60,
              onPressed: _onPaymentSuccess,
              color: Constants.textFieldBackgroundColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Text(
                      "Cash",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Spacer(),
                    Icon(
                      CupertinoIcons.chevron_right,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }

  void _onPaymentSuccess() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("cart");

    var order = {
      "order_id": const Uuid().v4(),
      "products": widget.cart.toString(),
      "operator_id": widget.data["operatorId"],
      "customer_name": widget.data["customerName"],
      "customer_phone": widget.data["customerPhone"],
      "customer_email": widget.data["customerEmail"],
      "mode_of_communication": widget.data["mode"],
      "delivery_mode": widget.mode,
      "address": widget.address,
      "total_amount": widget.amount,
    };
    var list = prefs.getStringList("orders");
    if (list != null) {
      list.add(jsonEncode(order));
    } else {
      list = [jsonEncode(order)];
    }
    final result = await prefs.setStringList("orders", list);
    if (result) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => PaymentStatus(),
          ),
          (route) => false);
    }
  }
}
