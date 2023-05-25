import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:swipe/swipe.dart';

class KonsultasiScreen extends StatefulWidget {
  final PersistentTabController navBarController;
  final int buildScreensLength;

  const KonsultasiScreen(
      {super.key,
      required this.navBarController,
      required this.buildScreensLength});

  @override
  State<KonsultasiScreen> createState() => _KonsultasiScreenState();
}

class _KonsultasiScreenState extends State<KonsultasiScreen> {
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
                  .jumpToTab(widget.navBarController.index + 1)
            }
        },
        onSwipeRight: () => {
          if (widget.navBarController.index > 0)
            {
              widget.navBarController
                  .jumpToTab(widget.navBarController.index - 1)
            }
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: const Color(0xFFEDF8FE),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                "Konsultasi",
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 2, bottom: 2),
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
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
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
                                borderSide:
                                    BorderSide(color: Colors.grey.shade100)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

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
                  .jumpToTab(widget.navBarController.index + 1)
            }
        },
        onSwipeRight: () => {
          if (widget.navBarController.index > 0)
            {
              widget.navBarController
                  .jumpToTab(widget.navBarController.index - 1)
            }
        },
        child: Container(
          color: const Color(0xFFEDF8FE),
        ),
      ),
    );
  }
}
