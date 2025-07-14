import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
<<<<<<< HEAD
import '../models/menu_item.dart';
=======
>>>>>>> main
>>>>>>> origin/menu
import 'detail_menu.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
<<<<<<< HEAD
=======
<<<<<<< HEAD
  static const Color mainGreen = Color(0xFF74A12E);

  final List<MenuItem> menuItems = [
    MenuItem(title: "Sushi 1", price: 90000, image: "https://via.placeholder.com/150"),
    MenuItem(title: "Sushi 2", price: 100000, image: "https://via.placeholder.com/150"),
    MenuItem(title: "Sushi 3", price: 110000, image: "https://via.placeholder.com/150"),
    MenuItem(title: "Sushi 4", price: 120000, image: "https://via.placeholder.com/150"),
  ];

  final Map<MenuItem, int> cart = {};

  void _addToCart(MenuItem item) {
    setState(() {
      cart[item] = (cart[item] ?? 0) + 1;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${item.title} ditambahkan ke keranjang')),
    );
  }

  void _removeFromCart(MenuItem item) {
    setState(() {
      if (cart[item] != null && cart[item]! > 0) {
        cart[item] = cart[item]! - 1;
        if (cart[item] == 0) cart.remove(item);
=======
>>>>>>> origin/menu
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
<<<<<<< HEAD
=======
>>>>>>> main
>>>>>>> origin/menu
      }
    });
  }

<<<<<<< HEAD
=======
<<<<<<< HEAD
  void _goToOrderDetail(MenuItem selectedItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OrderDetailScreen(selectedMenu: {
          'title': selectedItem.title,
          'price': selectedItem.price,
          'image': selectedItem.image,
        }),
=======
>>>>>>> origin/menu
  void _goToOrderDetail(Map<String, dynamic> selectedMenu) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OrderDetailScreen(selectedMenu: selectedMenu),
<<<<<<< HEAD
=======
>>>>>>> main
>>>>>>> origin/menu
      ),
    );
  }

<<<<<<< HEAD
=======
<<<<<<< HEAD
  int _totalItemInCart() {
    return cart.values.fold(0, (sum, item) => sum + item);
  }

=======
>>>>>>> main
>>>>>>> origin/menu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
=======
<<<<<<< HEAD
        backgroundColor: mainGreen,
        title: const Text("Menu Sushi"),
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
                    backgroundColor: Colors.red,
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
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: menuItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          final itemCount = cart[item] ?? 0;

          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    item.image,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.formattedPrice,
                        style: const TextStyle(color: mainGreen, fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => _removeFromCart(item),
                            icon: const Icon(Icons.remove_circle_outline),
                            color: mainGreen,
                          ),
                          Text('$itemCount'),
                          IconButton(
                            onPressed: () => _addToCart(item),
                            icon: const Icon(Icons.add_circle_outline),
                            color: mainGreen,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () => _goToOrderDetail(item),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainGreen,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text("Lihat Detail"),
                      ),
                    ],
                  ),
                ),
              ],
=======
>>>>>>> origin/menu
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
<<<<<<< HEAD
=======
>>>>>>> main
>>>>>>> origin/menu
            ),
          );
        },
      ),
    );
  }
<<<<<<< HEAD
}
=======
<<<<<<< HEAD
}
=======
}
>>>>>>> main
>>>>>>> origin/menu
