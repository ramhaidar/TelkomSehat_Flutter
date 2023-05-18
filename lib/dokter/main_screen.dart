import 'package:flutter/material.dart';

import '../custom_app_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: const Center(
        child: Text("Welcome to the Dashboard Screen!"),
      ),
    );
  }
}

class ReservasiScreen extends StatefulWidget {
  const ReservasiScreen({super.key});

  @override
  State<ReservasiScreen> createState() => _ReservasiScreenState();
}

class _ReservasiScreenState extends State<ReservasiScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text("Welcome to the Reservasi Screen!"),
      ),
    );
  }
}

class KonsultasiScreen extends StatefulWidget {
  const KonsultasiScreen({super.key});

  @override
  State<KonsultasiScreen> createState() => _KonsultasiScreenState();
}

class _KonsultasiScreenState extends State<KonsultasiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konsultasi"),
      ),
      body: const Center(
        child: Text("Welcome to the Konsultasi Screen!"),
      ),
    );
  }
}

class PenjemputanScreen extends StatefulWidget {
  const PenjemputanScreen({super.key});

  @override
  State<PenjemputanScreen> createState() => _PenjemputanScreenState();
}

class _PenjemputanScreenState extends State<PenjemputanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Penjemputan"),
      ),
      body: const Center(
        child: Text("Welcome to the Penjemputan Screen!"),
      ),
    );
  }
}