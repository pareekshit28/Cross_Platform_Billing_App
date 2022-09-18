import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xioamiode2code/constants.dart';
import 'package:xioamiode2code/screens/CartScreen.dart';
import 'package:xioamiode2code/screens/Checkout1.dart';
import 'package:xioamiode2code/screens/Checkout2.dart';
import 'package:xioamiode2code/screens/CreateOrder1.dart';
import 'package:xioamiode2code/screens/CreateOrder2.dart';
import 'package:xioamiode2code/screens/HomeScreen.dart';
import 'package:xioamiode2code/screens/OrderSummaryScreen.dart';
import 'package:xioamiode2code/screens/OrdersScreen.dart';
import 'package:xioamiode2code/screens/PaymentScreen.dart';
import 'package:xioamiode2code/screens/PaymentStatus.dart';
import 'package:xioamiode2code/screens/SettingsScreen.dart';
import 'package:xioamiode2code/screens/TrackOrderScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late final StreamSubscription<ConnectivityResult> _subscription;
  bool? _isDeviceConnected;
  final List _screens = [
    HomeScreen(),
    CartScreen(),
    CreateOrder1(),
    OrdersScreen(),
    SettingsScreen()
  ];

  @override
  void initState() {
    super.initState();
    _subscription = Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        if (_isDeviceConnected == null || _isDeviceConnected == false) {
          _isDeviceConnected = true;
          SharedPreferences.getInstance().then((prefs) {
            var orders = prefs.getStringList("orders");
            if (orders != null && orders.isNotEmpty) {
              const apiKey =
                  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhxdWVjYnJ3a292ZGtmcnB1b2d3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjM0NDEzMTksImV4cCI6MTk3OTAxNzMxOX0.lS6ZOpJzYta1KfKJtfhTwwV_ffq1C0P2mHsEpLUaQ6Y";
              var headers = {
                "apikey": apiKey,
                "Content-Type": "application/json",
                "Authorization": "Bearer $apiKey"
              };
              var url = Uri.parse(
                  'https://xquecbrwkovdkfrpuogw.supabase.co/rest/v1/orders');
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: ((context) => Dialog(
                        backgroundColor: Constants.textFieldBackgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  )),
                              SizedBox(height: 16),
                              Text(
                                "Please wait while we sync the database. Do not close the app",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )));
              http
                  .post(url, headers: headers, body: orders.toString())
                  .then((value) {
                Navigator.of(context).pop();
                if (value.statusCode == 201) {
                  prefs.remove("orders");
                }
              });
            }
          });
        }
      }
      if (event == ConnectivityResult.none) {
        if (_isDeviceConnected == null || _isDeviceConnected == true) {
          _isDeviceConnected = false;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(
                    Icons.signal_wifi_connected_no_internet_4_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text("No Internet Connection!"),
                ],
              ),
            ),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, -3), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Constants.scaffoldBackgroundColor,
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: const [
                  Icon(Icons.home_outlined, color: Colors.white),
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: const [
                  Icon(Icons.shopping_cart_outlined, color: Colors.white),
                  Text(
                    "Cart",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
              label: "Cart",
            ),
            const BottomNavigationBarItem(
              icon:
                  Icon(Icons.add_circle_outline, color: Colors.white, size: 40),
              label: "Create",
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: const [
                  Icon(Icons.shopping_bag_outlined, color: Colors.white),
                  Text(
                    "Orders",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: const [
                  Icon(Icons.settings_outlined, color: Colors.white),
                  Text(
                    "Settings",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
