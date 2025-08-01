import 'package:flutter/material.dart';
import 'package:sushi_app/screens/home/detail_transaksi.dart';
import 'package:sushi_app/screens/home/menu.dart'; 

class OrderDetailScreen extends StatelessWidget {
  final List<OrderedItem> orderedItems;

  const OrderDetailScreen({super.key, required this.orderedItems});

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.');
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = orderedItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rincian Pesanan"),
        backgroundColor: const Color.fromARGB(255, 255, 87, 34), 
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFF8F4EB), 
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: orderedItems.length,
              itemBuilder: (context, index) {
                final item = orderedItems[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${item.quantity} x Rp ${_formatPrice(item.price)}'),
                    trailing: Text(
                      'Rp ${_formatPrice(item.price * item.quantity)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 87, 34),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total Pembayaran', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    Text(
                      'Rp ${_formatPrice(totalPrice)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 87, 34),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 87, 34),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.push(
                       context,
                       MaterialPageRoute(builder: (_) => PaymentScreen(subtotal: totalPrice,)),
                     );
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Halaman Pembayaran belum diimplementasikan.'))
                    );
                  },
                  child: const Text('Lanjutkan ke Pembayaran', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}