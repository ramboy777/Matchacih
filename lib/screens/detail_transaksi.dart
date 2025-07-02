import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedMethod = 'Cash';

  final int subtotal = 70000;
  final int tax = 10000;
  final int admin = 5000;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController tableController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final int total = subtotal + tax + admin;

    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pembayaran")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nama"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: tableController,
              decoration: const InputDecoration(labelText: "No Meja"),
            ),
            const SizedBox(height: 20),

            // Metode Pembayaran
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedMethod == 'Cash' ? Colors.amber : null,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedMethod = 'Cash';
                    });
                  },
                  child: const Text("Cash"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedMethod == 'Scan' ? Colors.amber : null,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedMethod = 'Scan';
                    });
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

            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty || tableController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Lengkapi Nama dan Nomor Meja")),
                  );
                  return;
                }

                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Pembayaran Berhasil"),
                    content: Text(
                      "Terima kasih ${nameController.text}!\nMetode: $selectedMethod",
                    ),
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