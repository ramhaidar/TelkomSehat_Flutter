import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:swipe/swipe.dart';

class KonsultasiScreen extends StatefulWidget {
  final PersistentTabController navBarController;
  final int buildScreensLength;

  const KonsultasiScreen({
    super.key,
    required this.navBarController,
    required this.buildScreensLength,
  });

  @override
  State<KonsultasiScreen> createState() => _KonsultasiScreenState();
}

class _KonsultasiScreenState extends State<KonsultasiScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Map<String, dynamic>>> _loadItems() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      {'Keluhan': 'Keluhan 1', 'Jawaban': 'Jawaban 1'},
      {'Keluhan': 'Keluhan 2', 'Jawaban': 'Jawaban 2'},
      {'Keluhan': 'Keluhan 3', 'Jawaban': 'Jawaban 3'},
      {'Keluhan': 'Keluhan 4', 'Jawaban': 'Jawaban 4'},
      {'Keluhan': 'Keluhan 5', 'Jawaban': 'Jawaban 5'},
      {'Keluhan': 'Keluhan 6', 'Jawaban': 'Jawaban 6'},
      {'Keluhan': 'Keluhan 7', 'Jawaban': 'Jawaban 7'},
      {'Keluhan': 'Keluhan 8', 'Jawaban': 'Jawaban 8'},
      {'Keluhan': 'Keluhan 9', 'Jawaban': 'Jawaban 9'},
      {'Keluhan': 'Keluhan 10', 'Jawaban': 'Jawaban 10'},
    ];
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
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: const Color(0xFFEDF8FE),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.5,
                    horizontal: 7.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                "Konsultasi",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                  top: 2,
                                  bottom: 2,
                                ),
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.pink[50],
                                ),
                                child: const Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.add,
                                      color: Colors.pink,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      "Tambah",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 16,
                          right: 16,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Cari...",
                            hintStyle: TextStyle(color: Colors.grey.shade600),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey.shade600,
                              size: 20,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            contentPadding: const EdgeInsets.all(8),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.grey.shade100,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: FutureBuilder<List<Map<String, dynamic>>>(
                          future: _loadItems(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.pink,
                                  strokeWidth: 2,
                                ),
                              );
                            }
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            }
                            final items = snapshot.data ?? [];

                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.6,
                              child: SingleChildScrollView(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: items.length,
                                  itemBuilder: (context, index) {
                                    final item = items[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 3.0,
                                      ),
                                      child: ListTile(
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                        onTap: () {},
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 16,
                                        ),
                                        dense: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side: const BorderSide(
                                            color: Colors.grey,
                                            width: 3,
                                          ),
                                        ),
                                        tileColor: Colors.white,
                                        title: Text(
                                          item['Keluhan'],
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
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
