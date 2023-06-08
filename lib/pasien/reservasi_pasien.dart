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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Swipe(
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFEDF8FE),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 22.5, horizontal: 25),
              child: Text("TEST"),
            ),
          ),
        ),
      ),
    );
  }
}
