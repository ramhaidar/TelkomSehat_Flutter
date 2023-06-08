import 'package:flutter/material.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:focused_menu_custom/modals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login_screen.dart';

class PatientData {
  final String name;
  final String uname;

  PatientData({required this.name, required this.uname});
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  String name = '';
  String uname = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username') ?? 'null';
    var role = prefs.getString('role') ?? 'null';

    http.Response response;
    try {
      response = await http.post(
        Uri.parse('http://yntkts.ddns.net:8000/api/dashboard_patient'),
        body: {
          'username': username,
          'role': role,
        },
      ).timeout(
        const Duration(milliseconds: 3000),
      );
    } catch (e) {
      response = await http.post(
        Uri.parse('http://192.168.3.2:8000/api/dashboard_patient'),
        body: {
          'username': username,
          'role': role,
        },
      ).timeout(
        const Duration(milliseconds: 3000),
      );
    }

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final patientData = PatientData(
        name: data['user']['name'],
        uname: data['patient']['username'],
      );

      setState(() {
        name = patientData.name;
        uname = patientData.uname;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false; // Set isLoading to false in case of an error
      });
    }
  }

  Future<void> handleMenuSelection(BuildContext context, dynamic value) async {
    switch (value) {
      case 'logout':
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.remove('stayloggedintoken');
        prefs.remove('role');

        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 25,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.5, top: 5, right: 20),
                  child: Image.asset(
                    'assets/TelkomSehat.png',
                    fit: BoxFit.contain,
                    height: 32,
                  ),
                ),
                Text(
                  'TelkomSehat',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400, fontStyle: FontStyle.normal),
                ),
              ],
            ),
            FocusedMenuHolder(
              menuWidth: MediaQuery.of(context).size.width * 0.75,
              blurSize: 1.23,
              menuItemExtent: 35,
              menuBoxDecoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              duration: const Duration(milliseconds: 100),
              animateMenuItems: true,
              blurBackgroundColor: Colors.black54,
              openWithTap: !isLoading,
              menuOffset: 30,
              bottomOffsetHeight: 80.0,
              menuItems: <FocusedMenuItem>[
                FocusedMenuItem(
                  title: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leadingIcon: const Icon(null),
                  trailingIcon: const Icon(null),
                  onPressed: () {},
                ),
                FocusedMenuItem(
                  title: Text(
                    uname,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leadingIcon: const Icon(null),
                  trailingIcon: const Icon(null),
                  onPressed: () {},
                ),
                FocusedMenuItem(
                  title: const Text("Logout"),
                  trailingIcon: const Icon(Icons.logout),
                  leadingIcon: const Icon(Icons.logout),
                  onPressed: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    prefs.remove('stayloggedintoken');
                    prefs.remove('role');

                    if (context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    }
                  },
                ),
              ],
              onPressed: () {},
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://i.imgur.com/yoD9euD.jpg'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
