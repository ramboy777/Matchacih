import 'package:flutter/material.dart';

class TransaksiCash extends StatelessWidget {
  const TransaksiCash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pembayaran Cash")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.money, size: 80, color: Colors.green),
            const SizedBox(height: 20),
            const Text("Silakan bayar langsung di meja kasir.", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Kembali"),
            ),
          ],
        ),
      ),
    );
  }
}
