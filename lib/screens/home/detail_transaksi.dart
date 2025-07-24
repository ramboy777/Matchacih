import 'package:flutter/material.dart';
import 'package:sushi_app/screens/home/transaksi.dart';
import 'package:sushi_app/screens/home/transaksi_cash.dart';

class PaymentScreen extends StatefulWidget {
  final int subtotal;

  const PaymentScreen({super.key, required this.subtotal});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedMethod = 'Cash';

  late int subtotal;
  late int tax;
  late int admin;
  late int total;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController tableController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Hitung semua biaya saat halaman pertama kali dibuka
    subtotal = widget.subtotal;
    tax = (subtotal * 0.11).round(); // PPN 11% dari subtotal
    admin = 5000; // Biaya admin tetap
    total = subtotal + tax + admin;
  }
  
  // Helper function untuk format harga
  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.');
  }

  @override
  Widget build(BuildContext context) {
    // Tema warna utama agar konsisten
    const Color mainColor = Color.fromARGB(255, 255, 87, 34);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pembayaran"),
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nama Pelanggan"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: tableController,
              decoration: const InputDecoration(labelText: "Nomor Meja"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // Metode Pembayaran
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPaymentMethodButton('Cash', mainColor),
                // Anda bisa menambahkan metode lain di sini, contoh: 'E-Wallet'
                _buildPaymentMethodButton('Scan', mainColor),
              ],
            ),
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  buildRow("Subtotal", subtotal),
                  buildRow("Pajak (11%)", tax),
                  buildRow("Biaya Admin", admin),
                  const Divider(height: 20),
                  buildRow("Total", total, isBold: true, color: mainColor),
                ],
              ),
            ),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                // Validasi input
                if (nameController.text.isEmpty || tableController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Harap lengkapi Nama dan Nomor Meja")),
                  );
                  return;
                }

                // 2. Logika yang sudah diperbarui
                if (selectedMethod == 'Cash') {
                  // Jika 'Cash', arahkan ke halaman TransaksiCash
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TransaksiCash()),
                  );
                } else {
                  // Untuk metode lain, tampilkan dialog sukses
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Pembayaran Berhasil"),
                      content: Text(
                        "Terima kasih, ${nameController.text}!\nPesanan untuk meja ${tableController.text} sedang diproses.\n\nTotal: Rp ${_formatPrice(total)}\nMetode: $selectedMethod",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).popUntil((route) => route.isFirst);
                          },
                          child: const Text("Selesai"),
                        )
                      ],
                    ),
                  );
                }
              },
              child: const Text("Bayar Sekarang", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodButton(String method, Color activeColor) {
    final bool isActive = selectedMethod == method;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: isActive ? Colors.white : activeColor,
        backgroundColor: isActive ? activeColor : Colors.white,
        side: BorderSide(color: activeColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        setState(() {
          selectedMethod = method;
        });
      },
      child: Text(method),
    );
  }

  // Helper widget untuk baris rincian harga
  Widget buildRow(String label, int value, {bool isBold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontSize: isBold ? 16: 14)),
          Text("Rp ${_formatPrice(value)}", style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: color, fontSize: isBold ? 16: 14)),
        ],
      ),
    );
  }
}