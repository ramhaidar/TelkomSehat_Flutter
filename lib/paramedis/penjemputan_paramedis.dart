import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:swipe/swipe.dart';

class PenjemputanScreen extends StatefulWidget {
  final PersistentTabController navBarController;
  final int buildScreensLength;

  const PenjemputanScreen(
      {super.key,
      required this.navBarController,
      required this.buildScreensLength});

  @override
  State<PenjemputanScreen> createState() => _PenjemputanScreenState();
}

class _PenjemputanScreenState extends State<PenjemputanScreen> {
  @override
  void initState() {
    super.initState();
  }

  String getGoogleMapsLink(double latitude, double longitude) {
    final String lat = latitude.toString();
    final String lon = longitude.toString();
    return 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
  }

  Future<void> showConfirmationDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah Anda ingin menjemput pasien tersebut?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Logika saat tombol 'Ya' pada pop-up konfirmasi ditekan
              },
              child: const Text('Ya'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Logika saat tombol 'Tidak' pada pop-up konfirmasi ditekan
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
      body: Swipe(
          verticalMaxWidthThreshold: 50,
          verticalMinDisplacement: 100,
          verticalMinVelocity: 300,
          horizontalMaxHeightThreshold: 500,
          horizontalMinDisplacement: 0,
          horizontalMinVelocity: 0,
          onSwipeLeft: () => {
                if (widget.navBarController.index !=
                    widget.buildScreensLength - 1)
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
                            "Penjemputan",
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
                    itemCount: 3, // Jumlah data contoh
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ListTile(
                                title: Text(
                                  'Nama',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  'Robith Naufal Razzak',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              const ListTile(
                                title: Text(
                                  'Nomor Telepon',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  '0822720156',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                      size: 30,
                                    ),
                                    const SizedBox(width: 8),
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Latitude:',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                '-6.9788254',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Longitude:',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                '107.6316195',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        const double latitude =
                                            -6.9788254; // Ganti dengan nilai latitude yang sesuai
                                        const double longitude =
                                            107.6316195; // Ganti dengan nilai longitude yang sesuai
                                        final String googleMapsLink =
                                            getGoogleMapsLink(
                                                latitude, longitude);
                                        // Menggunakan googleMapsLink sesuai kebutuhan, misalnya mengirimnya ke layanan peta
                                        print(googleMapsLink);
                                      },
                                      icon: const Icon(
                                        Icons.open_in_new,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      showConfirmationDialog();
                                    },
                                    icon: const Icon(Icons.car_rental),
                                    label: const Text('Jemput'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
