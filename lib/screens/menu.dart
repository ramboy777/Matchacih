import 'package:flutter/material.dart';
import '../models/menu_card.dart';
import 'detail_menu.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
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
      if (cart[title] != null && cart[title]! > 0) {
        cart[title] = cart[title]! - 1;
        if (cart[title] == 0) cart.remove(title);
      }
    });
  }

  void _goToOrderDetail(Map<String, dynamic> selectedItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OrderDetailScreen(selectedMenu: {
          'title': selectedItem['title'],
          'price': selectedItem['price'],
          'image': selectedItem['image'],
        }),
      ),
    );
  }

  int _totalItemInCart() {
    return cart.values.fold(0, (sum, item) => sum + item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EB),
      appBar: AppBar(
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

          return MenuCard(
            title: item['title'],
            price: item['price'],
            image: item['image'],
            description: item['description'],
            quantity: quantity,
            onAdd: () => _addToCart(title),
            onRemove: () => _removeFromCart(title),
            onViewDetail: () => _goToOrderDetail(item),
          );
        },
      ),
    );
  }
}