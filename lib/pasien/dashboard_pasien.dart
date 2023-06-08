import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:swipe/swipe.dart';

class AppointmentCard extends StatelessWidget {
  final int appointmentNumber;
  final String date;
  final String time;
  final String doctorName;
  final String specialist;

  const AppointmentCard({
    super.key,
    required this.appointmentNumber,
    required this.date,
    required this.time,
    required this.doctorName,
    required this.specialist,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: InkWell(
          onTap: () {
            // Aksi yang dijalankan saat appointment di-tap (misalnya: buka detail appointment)
            // Tambahkan logika aksi yang sesuai di sini
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child: AutoSizeText(
                    date,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  child: AutoSizeText(
                    time,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  child: AutoSizeText(
                    doctorName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  child: AutoSizeText(
                    specialist,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// void waktu() async {
//   var now = DateTime.now();
//   var formatter = DateFormat('EEEE, dd-MM-yyyy', 'id');
//   String formattedDate = formatter.format(now);
// }

class DashboardScreen extends StatefulWidget {
  final PersistentTabController navBarController;
  final int buildScreensLength;

  const DashboardScreen(
      {super.key,
      required this.navBarController,
      required this.buildScreensLength});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
        onSwipeLeft: () => {
          if (widget.navBarController.index != widget.buildScreensLength - 1)
            {
              widget.navBarController
                  .jumpToTab(widget.navBarController.index + 1),
            }
        },
        onSwipeRight: () => {
          if (widget.navBarController.index > 0)
            {
              widget.navBarController
                  .jumpToTab(widget.navBarController.index - 1),
            }
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: const Color(0xFFEDF8FE),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.5, horizontal: 7.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.25),
                                    spreadRadius: 1.23,
                                    blurRadius: 25,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: SizedBox(
                                  height: 200,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            'TelkomSehat Siap\nMelayani Anda',
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF012970),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          Expanded(
                                            child: Image.asset(
                                              'assets/dashboard.png',
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.25),
                                    spreadRadius: 1.23,
                                    blurRadius: 25,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: SizedBox(
                                  height: 200,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.5),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                AutoSizeText(
                                                  'Waktu Sekarang',
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        const Color(0xFF012970),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CountdownTimer(
                                                  endTime: DateTime.now()
                                                          .millisecondsSinceEpoch +
                                                      1000 * 60 * 60 * 24,
                                                  // set the countdown end time to 24 hours from now
                                                  widgetBuilder: (_, time) {
                                                    return AutoSizeText(
                                                      DateFormat('hh:mm:ss a')
                                                          .format(
                                                              DateTime.now()),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFF012970),
                                                      ),
                                                      maxLines: 1,
                                                    );
                                                  },
                                                ),
                                                CountdownTimer(
                                                  endTime: DateTime.now()
                                                          .millisecondsSinceEpoch +
                                                      1000 * 60 * 60 * 24,
                                                  // set waktu akhir countdown ke 24 jam dari waktu sekarang
                                                  widgetBuilder: (_, time) {
                                                    return AutoSizeText(
                                                      DateFormat(
                                                              'EEEE, dd-MM-yyyy',
                                                              'id')
                                                          .format(
                                                        DateTime.now(),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFF012970),
                                                      ),
                                                      maxLines: 1,
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.25),
                                spreadRadius: 1.23,
                                blurRadius: 25,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: SizedBox(
                              height: 200,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30, bottom: 15),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            AutoSizeText(
                                              'Jumlah Reservasi',
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xFF012970),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFECDF),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: const Icon(
                                              CupertinoIcons.group,
                                              size: 50,
                                              color: Color(0xFFFF771D),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AutoSizeText(
                                                "1",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.openSans(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xFF012970),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                                child: AutoSizeText(
                                                  "from 8 total",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        const Color(0xFF012970),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
