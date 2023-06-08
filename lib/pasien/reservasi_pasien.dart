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

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedDoctor;
  TextEditingController keluhanController = TextEditingController();

  Future<void> showReservationPopup() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pilih Tanggal',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                  },
                  child: Text(
                    selectedDate != null
                        ? selectedDate.toString().substring(0, 10)
                        : 'Pilih Tanggal',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Pilih Waktu',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        selectedTime = pickedTime;
                      });
                    }
                  },
                  child: Text(
                    selectedTime != null
                        ? selectedTime!.format(context)
                        : 'Pilih Waktu',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Pilih Dokter',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButton<String>(
                  value: selectedDoctor,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDoctor = newValue;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'Dr. John Doe',
                      child: Text('Dr. John Doe'),
                    ),
                    // Tambahkan dropdown item dokter lain di sini
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Keluhan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: keluhanController,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan keluhan',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Logika saat tombol 'Simpan' pada pop-up ditekan
                      Navigator.pop(context);
                    },
                    child: const Text('Simpan'),
                  ),
                ),
              ],
            ),
          ),
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
                          child: ElevatedButton(
                            onPressed: showReservationPopup,
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
                            title: Text('Nama: ${data['dokter']}'),
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
                            trailing: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Konfirmasi'),
                                      content: const Text(
                                          'Apakah Anda yakin ingin membatalkan?'),
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
                                          },
                                          child: const Text('Batal'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text('Batal'),
                            ),
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
