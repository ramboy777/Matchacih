import 'package:flutter/material.dart';
import 'detail_transaksi.dart';

class OrderDetailScreen extends StatelessWidget {
  final Map<String, dynamic> selectedMenu;

  const OrderDetailScreen({required this.selectedMenu, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pemesanan")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Menu:", style: TextStyle(color: Colors.grey[400])),
            const SizedBox(height: 5),
            Text(selectedMenu['title'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text("Harga:", style: TextStyle(color: Colors.grey[400])),
            const SizedBox(height: 5),
            Text("Rp ${selectedMenu['price']}", style: const TextStyle(fontSize: 18, color: Colors.amber)),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DetailTransaksi()));
              },
              child: const Text("Bayar"),
            ),
          ],
        ),
      ),
    );
  }
}
