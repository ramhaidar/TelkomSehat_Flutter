import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:telkom_sehat/custom_app_bar.dart';

import 'dashboard_mahasiswa.dart';
import 'konsultasi_mahasiswa.dart';
import 'penjemputan_mahasiswa.dart';
import 'reservasi_mahasiswa.dart';

class MahasiswaScreen extends StatefulWidget {
  const MahasiswaScreen({super.key});

  @override
  State<MahasiswaScreen> createState() => _MahasiswaScreenState();
}

class _MahasiswaScreenState extends State<MahasiswaScreen> {
  late PersistentTabController navBarController;

  @override
  void initState() {
    super.initState();
    navBarController = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> buildScreens() {
    //   return [
    //     DashboardScreen(navBarController: navBarController, buildScreensLength: 4),
    //     ReservasiScreen(navBarController: navBarController, buildScreensLength: 4),
    //     KonsultasiScreen(navBarController: navBarController, buildScreensLength: 4),
    //     PenjemputanScreen(navBarController: navBarController, buildScreensLength: 4),
    //   ];
    // }

    List<Widget> buildScreens() {
      return [
        DashboardScreen(
            navBarController: navBarController, buildScreensLength: 4),
        ReservasiScreen(
            navBarController: navBarController, buildScreensLength: 4),
        KonsultasiScreen(
            navBarController: navBarController, buildScreensLength: 4),
        PenjemputanScreen(
            navBarController: navBarController, buildScreensLength: 4),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          // icon: Image.asset('assets/navBarIcons/home.png'),
          icon: const Icon(LineIcons.home),
          title: ("Dashboard"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          // icon: Image.asset('assets/navBarIcons/dashboard.png'),
          icon: const Icon(LineIcons.calendar),
          title: ("Reservasi"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          // icon: Image.asset('assets/navBarIcons/konsultasi.png'),
          icon: const Icon(LineIcons.comment),
          title: ("Konsultasi"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          // icon: Image.asset('assets/navBarIcons/reservasi.png'),
          icon: const Icon(LineIcons.ambulance),
          title: ("Penjemputan"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      body: PersistentTabView(
        context,
        navBarHeight: 75,
        padding: const NavBarPadding.all(7),
        popAllScreensOnTapAnyTabs: true,
        hideNavigationBar: false,
        controller: navBarController,
        screens: buildScreens(),
        items: navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 60),
        ),
        onItemSelected: (index) {
          setState(() {
            navBarController.index = index; // THIS IS CRITICAL!! Don't miss it!
          });
        },
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}
