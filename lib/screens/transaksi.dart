import 'package:flutter/material.dart';

class Transaksi extends StatelessWidget {
  const Transaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pembayaran")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 100,
              color: Colors.grey[800], 
              margin: const EdgeInsets.only(bottom: 20),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Cash")),
            ElevatedButton(onPressed: () {}, child: const Text("Scan")),
          ],
        ),
      ),
    );
  }
}
