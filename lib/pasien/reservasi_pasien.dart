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
      body: SizedBox(
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Reservasi",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.pink[50],
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.pink,
                                size: 20,
                              ),
                              SizedBox(width: 2),
                              Text(
                                "Buat Reservasi",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
                          borderSide: BorderSide(color: Colors.grey.shade100),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      // Data dummy
                      final data = {
                        'dokter': 'Dr. John Doe',
                        'spesialis': 'Dokter Umum',
                        'tanggal': '12 Juni 2023',
                        'jam': '10:00 - 11:00',
                        'keluhan': 'Sakit kepala',
                        'status': 'Terkonfirmasi',
                      };

                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          child: ListTile(
                            title: Text('Nama:${data['dokter']}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Spesialis: ${data['spesialis']}'),
                                Text('Tanggal: ${data['tanggal']}'),
                                Text('Jam: ${data['jam']}'),
                                Text('Keluhan: ${data['keluhan']}'),
                                Text('Status: ${data['status']}'),
                              ],
                            ),
                            trailing: const Text('Batal'),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
