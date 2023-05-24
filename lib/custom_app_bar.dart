import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

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
            GestureDetector(
              onTap: () {
                // Tampilkan menu di sini
              },
              child: const CircleAvatar(
                // backgroundImage: AssetImage('assets/profile/haidarx.jpg'),
                backgroundImage:
                    NetworkImage('https://i.imgur.com/yoD9euD.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
