import 'package:flutter/material.dart';
import 'package:sushi_app/models/menu_card.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  static const Color mainOrange = Color.fromARGB(255, 255, 87, 34);

  final List<String> categories = ["Makan", "Minum", "Bundle"];
  String selectedCategory = "Makan";

  final List<Map<String, dynamic>> menuItems = [
    {
      'title': "Choco Cookie Shake",
      'price': 29000,
      'image': "https://via.placeholder.com/150",
      'description': "Rasa cokelat istimewa untuk menemani hari manis dan penghilang dahaga.",
      'category': "Minum"
    },
    {
      'title': "Butterscotch Milk Crumble",
      'price': 29000,
      'image': "https://via.placeholder.com/150",
      'description': "Butterscotch dengan paduan caramel, susu dengan sea salt cream dan caramel.",
      'category': "Minum"
    },
    {
      'title': "Vanilla O' Crumbs",
      'price': 29000,
      'image': "https://via.placeholder.com/150",
      'description': "Perpaduan vanilla, butterscotch dan susu dilengkapi dengan saus caramel juga topping.",
      'category': "Minum"
    },
  ];

  final Map<String, int> cart = {};

  void _addToCart(String title) {
    setState(() {
      cart[title] = (cart[title] ?? 0) + 1;
    });
  }

  void _removeFromCart(String title) {
    setState(() {
      if (cart[title] != null && cart[title]! > 0) {
        cart[title] = cart[title]! - 1;
        if (cart[title] == 0) cart.remove(title);
      }
    });
  }

  int _totalItemInCart() {
    return cart.values.fold(0, (sum, item) => sum + item);
  }

  int _totalHarga() {
    int total = 0;
    for (var item in menuItems) {
      final title = item['title'];
      final jumlah = cart[title] ?? 0;
      total += jumlah * (item['price'] as int? ?? 0);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = menuItems.where((item) => item['category'] == selectedCategory).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EB),
      appBar: AppBar(
        backgroundColor: mainOrange,
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.3),
        title: const Text(
          "Menu",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                const Icon(Icons.shopping_cart),
                if (_totalItemInCart() > 0)
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: mainOrange,
                    child: Text(
                      '${_totalItemInCart()}',
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedCategory == category ? mainOrange : Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(category),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                final title = item['title'];
                final quantity = cart[title] ?? 0;

                return MenuCard(
                  title: item['title'],
                  price: item['price'],
                  image: item['image'],
                  description: item['description'],
                  quantity: quantity,
                  onAdd: () => _addToCart(title),
                  onRemove: () => _removeFromCart(title),
                );
              },
            ),
          ),
          if (_totalItemInCart() > 0)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Cek Keranjang (${_totalItemInCart()} produk)", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("Rp ${_totalHarga().toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.')}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Text(">", style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}