import 'package:flutter/material.dart';
import 'menu.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  int numberOfPeople = 1;
  final TextEditingController _tableController = TextEditingController();

  void _increase() {
    setState(() {
      numberOfPeople++;
    });
  }

  void _decrease() {
    setState(() {
      if (numberOfPeople > 1) numberOfPeople--;
    });
  }

  void _proceedReservation() {
    if (_tableController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Nomor meja wajib diisi!")));
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => const MenuScreen()));
  }

<<<<<<< HEAD
=======
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

>>>>>>> menu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reservasi Dine In")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Berapa Orang?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: _decrease, icon: const Icon(Icons.remove_circle, color: Colors.redAccent)),
                Text("$numberOfPeople", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                IconButton(onPressed: _increase, icon: const Icon(Icons.add_circle, color: Colors.green)),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _tableController,
              decoration: const InputDecoration(labelText: "Masukkan Nomor Meja"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _proceedReservation,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Pesan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
