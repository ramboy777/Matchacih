import 'package:flutter/material.dart';
import 'detail_menu.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<Map<String, dynamic>> menuItems = [
    {"title": "Sushi 1", "price": 90000, "image": "https://via.placeholder.com/100"},
    {"title": "Sushi 2", "price": 100000, "image": "https://via.placeholder.com/100"},
    {"title": "Sushi 3", "price": 110000, "image": "https://via.placeholder.com/100"},
    {"title": "Sushi 4", "price": 120000, "image": "https://via.placeholder.com/100"},
  ];

  final Map<String, int> cart = {}; // item -> jumlah

  void _addToCart(String itemName) {
    setState(() {
      cart[itemName] = (cart[itemName] ?? 0) + 1;
    });
  }

  void _removeFromCart(String itemName) {
    setState(() {
      if (cart[itemName] != null && cart[itemName]! > 0) {
        cart[itemName] = cart[itemName]! - 1;
        if (cart[itemName] == 0) {
          cart.remove(itemName);
        }
      }
    });
  }

  void _goToOrderDetail(Map<String, dynamic> selectedMenu) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OrderDetailScreen(selectedMenu: selectedMenu),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Sushi"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          final itemCount = cart[item['title']] ?? 0;

          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () => _goToOrderDetail(item), // <<< buka detail satu item
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.network(item['image'], width: 80, height: 80, fit: BoxFit.cover),
                        const SizedBox(height: 8),
                        Text(item['title'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        Text("Rp ${item['price'] ~/ 1000}K", style: const TextStyle(color: Colors.amber, fontSize: 12)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => _removeFromCart(item['title']),
                          icon: const Icon(Icons.remove),
                        ),
                        Text('$itemCount'),
                        IconButton(
                          onPressed: () => _addToCart(item['title']),
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}