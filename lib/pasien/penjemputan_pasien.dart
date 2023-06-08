import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:swipe/swipe.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class PenjemputanScreen extends StatefulWidget {
  final PersistentTabController navBarController;
  final int buildScreensLength;

  const PenjemputanScreen(
      {super.key,
      required this.navBarController,
      required this.buildScreensLength});

  @override
  State<PenjemputanScreen> createState() => _PenjemputanScreenState();
}

class _PenjemputanScreenState extends State<PenjemputanScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swipe(
        verticalMaxWidthThreshold: 50,
        verticalMinDisplacement: 100,
        verticalMinVelocity: 300,
        horizontalMaxHeightThreshold: 500,
        horizontalMinDisplacement: 0,
        horizontalMinVelocity: 0,
        onSwipeLeft: () {
          if (widget.navBarController.index != widget.buildScreensLength - 1) {
            widget.navBarController
                .jumpToTab(widget.navBarController.index + 1);
          }
        },
        onSwipeRight: () {
          if (widget.navBarController.index > 0) {
            widget.navBarController
                .jumpToTab(widget.navBarController.index - 1);
          }
        },
        child: Container(
          color: const Color(0xFFEDF8FE),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C757D),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          BootstrapIcons.collection,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      Text(
                        'Tidak Dalam Masa Emergency',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/penjemputan/centerImage.png',
                      scale: 1.5,
                    ),
                    Text(
                      'EMERGENCY!',
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF012970),
                      ),
                    ),
                    const SizedBox(height: 12.5),
                    const Text(
                      'Penjemputan hanya untuk keadaan Darurat saja.',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan aksi yang ingin dilakukan saat tombol ditekan
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        // Warna latar belakang tombol
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Kirim lokasi anda',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
