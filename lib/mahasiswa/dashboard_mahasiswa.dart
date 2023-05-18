import 'package:flutter/material.dart';
import 'package:telkom_sehat/custom_app_bar.dart';

class AppointmentCard extends StatelessWidget {
  final int appointmentNumber;
  final String date;
  final String time;
  final String doctorName;
  final String specialist;

  const AppointmentCard({
    super.key,
    required this.appointmentNumber,
    required this.date,
    required this.time,
    required this.doctorName,
    required this.specialist,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: InkWell(
          onTap: () {
            // Aksi yang dijalankan saat appointment di-tap (misalnya: buka detail appointment)
            // Tambahkan logika aksi yang sesuai di sini
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child: Text(
                    date,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  child: Text(
                    time,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  child: Text(
                    doctorName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  child: Text(
                    specialist,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            child: Text(
              "Section Penjemputan",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Implementasikan bagian penjemputan di sini
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.blue,
            ),
            height: 80,
            width: double.infinity,
            child: const Center(
              child: Icon(
                Icons.person,
                size: 48,
                color: Colors.white,
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            child: Text(
              "Upcoming Appointment",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Implementasikan bagian upcoming appointment di sini
          SizedBox(
            height: 200,
            child: PageView(
              pageSnapping: false,
              allowImplicitScrolling: true,
              padEnds: false,
              controller: PageController(viewportFraction: 0.8),
              children: const [
                AppointmentCard(
                  appointmentNumber: 1,
                  date: "12 Tuesday",
                  time: "10:00 AM",
                  doctorName: "Dr. John Doe",
                  specialist: "Cardiologist",
                ),
                AppointmentCard(
                  appointmentNumber: 2,
                  date: "14 Thursday",
                  time: "2:30 PM",
                  doctorName: "Dr. Jane Smith",
                  specialist: "Dermatologist",
                ),
                AppointmentCard(
                  appointmentNumber: 3,
                  date: "16 Saturday",
                  time: "4:00 PM",
                  doctorName: "Dr. David Johnson",
                  specialist: "Orthopedic Surgeon",
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            child: Text(
              "Total Reservasi",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Implementasikan bagian total reservasi di sini
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.green,
            ),
            height: 80,
            width: double.infinity,
            child: const Center(
              child: Text(
                "Total Reservasi: 10",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}