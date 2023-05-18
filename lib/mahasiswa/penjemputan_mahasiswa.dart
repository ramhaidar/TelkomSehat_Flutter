import 'package:flutter/material.dart';
import 'package:telkom_sehat/custom_app_bar.dart';

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
