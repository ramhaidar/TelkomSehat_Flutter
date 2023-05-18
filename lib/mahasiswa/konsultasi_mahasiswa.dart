import 'package:flutter/material.dart';
import 'package:telkom_sehat/custom_app_bar.dart';

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