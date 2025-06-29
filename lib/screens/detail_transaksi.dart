import 'package:flutter/material.dart';

class DetailTransaksi extends StatelessWidget {
  const DetailTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy — kamu bisa ganti dengan data dari pemesanan sebenarnya
    final int subtotal = 70000;
    final int tax = 10000;
    final int admin = 5000;
    final int total = subtotal + tax + admin;

    String selectedMethod = 'Cash';

    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pembayaran")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Nama dan Meja
            TextField(
              decoration: InputDecoration(labelText: "Nama"),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: "No Meja"),
            ),
            const SizedBox(height: 20),

            // Metode Pembayaran
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Set state jika ini StatefulWidget
                  },
                  child: const Text("Cash"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Set state jika ini StatefulWidget
                  },
                  child: const Text("Scan"),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Rincian Pembayaran
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildRow("Subtotal", subtotal),
                buildRow("Pajak", tax),
                buildRow("Admin", admin),
                const Divider(),
                buildRow("Total", total, isBold: true),
              ],
            ),

            const Spacer(),

            // Tombol selesai
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Pembayaran Berhasil"),
                    content: const Text("Terima kasih telah memesan!"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Tutup"),
                      )
                    ],
                  ),
                );
              },
              child: const Text("Selesai"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String label, int value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text("Rp ${value.toString()}",
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  color: isBold ? Colors.amber : Colors.white)),
        ],
      ),
    );
  }
}