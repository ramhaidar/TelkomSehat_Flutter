import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:swipe/swipe.dart';

class PenjemputanScreen extends StatefulWidget {
  final PersistentTabController navBarController;
  final int buildScreensLength;
  const PenjemputanScreen({super.key, required this.navBarController, required this.buildScreensLength});

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
        onSwipeLeft: () => {
          if (widget.navBarController.index != widget.buildScreensLength-1)
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
        )
      ),
    );
  }
}
