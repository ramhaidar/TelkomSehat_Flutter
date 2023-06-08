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

  Future<void> showConfirmationDialog(String action) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: Text('Apakah Anda yakin ingin $action reservasi ini?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Logika saat tombol 'Terima' ditekan
                if (action == 'terima') {
                  // print('Reservasi diterima');
                } else if (action == 'tolak') {
                  // print('Reservasi ditolak');
                }
              },
              child: const Text('Ya'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tidak'),
            ),
          ],
        );
      },
    );
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
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Reservasi",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
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
                          borderSide: BorderSide(color: Colors.grey.shade100),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2, // Jumlah data contoh
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ListTile(
                                title: Text('Nama'),
                                subtitle: Text('John Doe'),
                              ),
                              const ListTile(
                                title: Text('Keluhan'),
                                subtitle: Text('Sakit kepala'),
                              ),
                              const ListTile(
                                title: Text('Tanggal'),
                                subtitle: Text('8 Juni 2023'),
                              ),
                              const ListTile(
                                title: Text('Jam'),
                                subtitle: Text('14:30'),
                              ),
                              ButtonBar(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      showConfirmationDialog('terima');
                                    },
                                    child: const Text('Terima'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      showConfirmationDialog('tolak');
                                    },
                                    child: const Text('Tolak'),
                                  ),
                                ],
                              ),
                            ],
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
