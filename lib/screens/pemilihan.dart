import 'package:flutter/material.dart';
import 'menu.dart';
import 'reservasi.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pilihan Pesanan")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // LOGO DI ATAS
            Center(
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image.asset(
                  'assets/images/logo.png', // Ganti sesuai nama logo
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // DINE IN
            const Text(
              "DINE IN",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ReservationScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text("Pilih DINE IN", style: TextStyle(fontSize: 16)),
            ),

            const SizedBox(height: 30),

            // TAKE AWAY
            const Text(
              "TAKE AWAY",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const MenuScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text("Pilih TAKE AWAY", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
