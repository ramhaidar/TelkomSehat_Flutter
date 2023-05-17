import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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

class ReservasiScreen extends StatelessWidget {
  const ReservasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reservasi"),
      ),
      body: const Center(
        child: Text("Welcome to the Reservasi Screen!"),
      ),
    );
  }
}

class KonsultasiScreen extends StatelessWidget {
  const KonsultasiScreen({super.key});

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

class PenjemputanScreen extends StatelessWidget {
  const PenjemputanScreen({super.key});

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