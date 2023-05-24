import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:swipe/swipe.dart';

class ReservasiScreen extends StatefulWidget {
  final PersistentTabController navBarController;
  final int buildScreensLength;

  const ReservasiScreen(
      {super.key,
      required this.navBarController,
      required this.buildScreensLength});

  @override
  State<ReservasiScreen> createState() => _ReservasiScreenState();
}

class _ReservasiScreenState extends State<ReservasiScreen> {
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
        child: Container(
          color: const Color(0xFFEDF8FE),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.blue,
                      ),
                      child: const Center(
                        child: Text(
                          "Available",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.blueGrey,
                      ),
                      child: const Center(
                        child: Text(
                          "Status",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Center(
                child: Text("Welcome to the Reservasi Screen!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
