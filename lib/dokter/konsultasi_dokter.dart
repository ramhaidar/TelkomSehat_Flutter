import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:swipe/swipe.dart';

class KonsultasiScreen extends StatefulWidget {
  final PersistentTabController navBarController;
  final int buildScreensLength;

  const KonsultasiScreen(
      {super.key,
      required this.navBarController,
      required this.buildScreensLength});

  @override
  State<KonsultasiScreen> createState() => _KonsultasiScreenState();
}

class _KonsultasiScreenState extends State<KonsultasiScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<Map<String, dynamic>> data = [
    {'Nama': 'John Doe', 'Keluhan': 'Keluhan 1'},
    {'Nama': 'Jane Smith', 'Keluhan': 'Keluhan 2'},
    {'Nama': 'David Johnson', 'Keluhan': 'Keluhan 3'},
    // ...
  ];

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
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: const Color(0xFFEDF8FE),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SafeArea(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Konsultasi",
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
                                borderSide:
                                    BorderSide(color: Colors.grey.shade100)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('Nama')),
                            DataColumn(label: Text('Keluhan')),
                            DataColumn(label: Text('Aksi')),
                          ],
                          rows: List.generate(data.length, (index) {
                            final item = data[index];
                            return DataRow(cells: [
                              DataCell(Text(item['Nama'])),
                              DataCell(Text(item['Keluhan'])),
                              DataCell(
                                ElevatedButton(
                                  onPressed: () {
                                    // Aksi yang ingin dilakukan saat tombol ditekan
                                  },
                                  child: const Text('Balas'),
                                ),
                              ),
                            ]);
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
