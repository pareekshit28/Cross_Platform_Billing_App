import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xioamiode2code/screens/MainScreen.dart';
import 'package:printing/printing.dart';
import '../constants.dart';

class PaymentStatus extends StatefulWidget {
  const PaymentStatus({Key? key}) : super(key: key);

  @override
  State<PaymentStatus> createState() => _PaymentStatusState();
}

class _PaymentStatusState extends State<PaymentStatus> {
  void sendInvoice() async {
    var uname = 'AC17502b3e837c91324133e0474f783808';
    var pword = 'ba7e86534319bcaf9116f89293a8f036';
    var authn = 'Basic ' + base64Encode(utf8.encode('$uname:$pword'));

    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': authn,
    };

    var msg = {
      'Body':
          'Thank you for visiting Mi Store. Here is the invoice of your order.',
      'From': 'whatsapp:+14155238886',
      'To': 'whatsapp:+919390477549',
    };

    var media = {
      'From': 'whatsapp:+14155238886',
      'MediaUrl':
          'https://drive.google.com/uc?export=download&id=1ccJ6qjV1dMpPaTwPNcTDjNapd_Gq6H7l',
      'To': 'whatsapp:+919390477549',
    };

    var url = Uri.parse(
        'https://api.twilio.com/2010-04-01/Accounts/AC17502b3e837c91324133e0474f783808/Messages.json');
    var res = await http.post(url, headers: headers, body: msg);
    var res2 = await http.post(url, headers: headers, body: media);
    print(res.body);
    print(res2.body);
  }

  @override
  void initState() {
    super.initState();
    sendInvoice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Constants.scaffoldBackgroundColor,
          elevation: 0,
          title: const Text(
            "Payment Status",
            style: TextStyle(fontSize: 28),
          ),
          toolbarHeight: 70,
          titleSpacing: 20,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
          child: Column(children: [
            Container(
              decoration: const BoxDecoration(
                color: Constants.textFieldBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    const Center(
                      child: Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 80,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Center(
                      child: Text(
                        "Payment Successful",
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Center(
                      child: Text(
                        "Invoice sent to customer on Whatsapp",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
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
              onPressed: () {
                final url = Uri.parse(
                    "https://drive.google.com/uc?export=download&id=1ccJ6qjV1dMpPaTwPNcTDjNapd_Gq6H7l");
                http.get(url).then((value) async {
                  if (value.statusCode == 200) {
                    await Printing.layoutPdf(
                        onLayout: (format) async => value.bodyBytes);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Row(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text("Something went wrong, please try again"),
                      ],
                    )));
                  }
                });
              },
              color: Constants.textFieldBackgroundColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Center(
                child: Text(
                  "Print Receipt",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            MaterialButton(
              height: 60,
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(builder: (context) => const MainScreen()),
                  (route) => false),
              color: Constants.textFieldBackgroundColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Center(
                child: Text(
                  "Go to Home",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ]),
        ));
  }
}
