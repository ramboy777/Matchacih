
import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
import '../models/menu_item.dart';
=======
>>>>>>> main
>>>>>>> origin/menu
=======
import '../models/menu_card.dart';
>>>>>>> menu
import 'detail_menu.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> menu
  static const Color mainGreen = Color(0xFF74A12E);

  final List<Map<String, dynamic>> menuItems = [
    {
      'title': "7-Piece Kappa's Choice Regular Set",
      'price': 81000,
      'image': "https://via.placeholder.com/150",
      'description': "Medium-Fatty Tuna, Tuna, Squid, Whelk, Yellowtail, Salmon, Flounder Fin"
    },
    {
      'title': "7-Piece Sushi",
      'price': 192000,
      'image': "https://via.placeholder.com/150",
      'description': "Bonito, Abalone, Octopus, Urchin, Shrimp, Sea Eel"
    },
    {
      'title': "Albacore Tuna",
      'price': 11000,
      'image': "https://via.placeholder.com/150",
      'description': "Ikan Tuna Albacore segar"
    },
    {
      'title': "Bering Sea Cockle",
      'price': 11000,
      'image': "https://via.placeholder.com/150",
      'description': "Kerang manis saus kecap dan wijen"
    },
    {
      'title': "Fresh Octopus",
      'price': 19000,
      'image': "https://via.placeholder.com/150",
      'description': "Gurita segar dengan cita rasa otentik"
    },
    {
      'title': "Japanese Omelette",
      'price': 11000,
      'image': "https://via.placeholder.com/150",
      'description': "Telur gulung khas Jepang"
    },
    {
      'title': "Popular Platter",
      'price': 89000,
      'image': "https://via.placeholder.com/150",
      'description': "Tuna, Albacore, Yellowtail, Salmon, Shrimp, Whelk"
    },
    {
      'title': "Pounded Tuna",
      'price': 11000,
      'image': "https://via.placeholder.com/150",
      'description': "Tuna cincang segar"
    },
    {
      'title': "Salmon with Avocado",
      'price': 21000,
      'image': "https://via.placeholder.com/150",
      'description': "Salmon dengan alpukat creamy"
    },
    {
      'title': "Scallop",
      'price': 21000,
      'image': "https://via.placeholder.com/150",
      'description': "Kerang segar dari laut utara"
    },
    {
      'title': "Shrimp",
      'price': 11000,
      'image': "https://via.placeholder.com/150",
      'description': "Udang segar lezat"
    },
    {
      'title': "Sushi Wrap with Tuna",
      'price': 11000,
      'image': "https://via.placeholder.com/150",
      'description': "Wrap tuna, daikon, perilla (dine-in only)"
    },
    {
      'title': "Tuna and Salmon",
      'price': 11000,
      'image': "https://via.placeholder.com/150",
      'description': "Dua kombinasi favorit: tuna dan salmon"
    },
    {
      'title': "Tuna and Shrimp Sushi",
      'price': 11000,
      'image': "https://via.placeholder.com/150",
      'description': "Tuna dan udang segar"
    },
    {
      'title': "Tuna",
      'price': 11000,
      'image': "https://via.placeholder.com/150",
      'description': "Ikan tuna segar"
    },
    {
      'title': "Salmon Roe",
      'price': 39000,
      'image': "https://via.placeholder.com/150",
      'description': "Telur salmon kualitas tinggi"
    },
    {
      'title': "Shrimp Tempura Roll",
      'price': 19000,
      'image': "https://via.placeholder.com/150",
      'description': "Gulungan udang goreng tempura"
    },
    {
      'title': "Soy Sauce Ramen",
      'price': 43000,
      'image': "https://via.placeholder.com/150",
      'description': "Ramen kuah soyu klasik"
    },
    {
      'title': "Hakata Tonkotsu Ramen",
      'price': 59000,
      'image': "https://via.placeholder.com/150",
      'description': "Ramen Hakata dengan acar pedas"
    },
    {
      'title': "Seaweed Root and Natto",
      'price': 11000,
      'image': "https://via.placeholder.com/150",
      'description': "Akar rumput laut dengan natto"
    },
    {
      'title': "Draft Beer",
      'price': 99000,
      'image': "https://via.placeholder.com/150",
      'description': "Bir dingin segar langsung dari tap"
    },
    {
      'title': "Alcohol-Free Cassis Orange",
      'price': 49000,
      'image': "https://via.placeholder.com/150",
      'description': "Minuman buah cassis tanpa alkohol"
    },
    {
      'title': "Iced Coffee",
      'price': 19000,
      'image': "https://via.placeholder.com/150",
      'description': "Kopi dingin menyegarkan"
    },
    {
      'title': "Mango Drink",
      'price': 29000,
      'image': "https://via.placeholder.com/150",
      'description': "Minuman mangga manis"
    },
    {
      'title': "Masumi Dry Gold (Sake)",
      'price': 94000,
      'image': "https://via.placeholder.com/150",
      'description': "Sake khas Jepang, tersedia di Jepang Timur"
    },
    {
      'title': "Premium Set (5 serving)",
      'price': 915000,
      'image': "https://via.placeholder.com/150",
      'description': "Set premium lengkap untuk 5 orang"
    },
    {
      'title': "Premium Set (3 serving)",
      'price': 549000,
      'image': "https://via.placeholder.com/150",
      'description': "Set premium untuk 3 orang"
    },
    {
      'title': "Happy Set (2 servings)",
      'price': 254000,
      'image': "https://via.placeholder.com/150",
      'description': "Paket happy untuk berdua"
    },
    {
      'title': "Happy Set (one serving)",
      'price': 91000,
      'image': "https://via.placeholder.com/150",
      'description': "Set lengkap untuk satu orang"
    },
  ];

  final Map<String, int> cart = {};

  void _addToCart(String title) {
    setState(() {
      cart[title] = (cart[title] ?? 0) + 1;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$title ditambahkan ke keranjang')),
    );
  }

  void _removeFromCart(String title) {
    setState(() {
<<<<<<< HEAD
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
=======
      if (cart[title] != null && cart[title]! > 0) {
        cart[title] = cart[title]! - 1;
        if (cart[title] == 0) cart.remove(title);
>>>>>>> menu
      }
    });
  }

<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
  void _goToOrderDetail(MenuItem selectedItem) {
=======
  void _goToOrderDetail(Map<String, dynamic> selectedItem) {
>>>>>>> menu
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OrderDetailScreen(selectedMenu: {
          'title': selectedItem['title'],
          'price': selectedItem['price'],
          'image': selectedItem['image'],
        }),
<<<<<<< HEAD
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
=======
>>>>>>> menu
      ),
    );
  }

<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> menu
  int _totalItemInCart() {
    return cart.values.fold(0, (sum, item) => sum + item);
  }

<<<<<<< HEAD
=======
>>>>>>> main
>>>>>>> origin/menu
=======
>>>>>>> menu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EB),
      appBar: AppBar(
<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> menu
        backgroundColor: mainGreen,
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.3),
        title: const Text(
          "Menu Sushi",
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
          childAspectRatio: 0.68,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          final title = item['title'];
          final quantity = cart[title] ?? 0;

<<<<<<< HEAD
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
=======
          return MenuCard(
            title: item['title'],
            price: item['price'],
            image: item['image'],
            description: item['description'],
            quantity: quantity,
            onAdd: () => _addToCart(title),
            onRemove: () => _removeFromCart(title),
            onViewDetail: () => _goToOrderDetail(item),
>>>>>>> menu
          );
        },
      ),
    );
  }
}
<<<<<<< HEAD
=======
<<<<<<< HEAD
}
=======
}
>>>>>>> main
>>>>>>> origin/menu
=======

>>>>>>> menu
