import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isPopupMenuOpen = false;

  final List<PopupMenuEntry<dynamic>> menuItems = [
    PopupMenuItem<dynamic>(
      value: 'Details',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Haidaruddin Muhammad Ramdhan',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1301204459',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    ),
    const PopupMenuItem<dynamic>(
      value: 'logout',
      child: Text('Log Out'),
    ),
  ];

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
                  padding: const EdgeInsets.only(top: 5, right: 20),
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
            PopupMenuButton<dynamic>(
              elevation: 25,
              offset: const Offset(0, 65),
              onSelected: (value) => handleMenuSelection(context, value),
              itemBuilder: (BuildContext context) => menuItems,
              child: const CircleAvatar(
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
