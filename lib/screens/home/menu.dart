import 'package:flutter/material.dart';
import 'package:sushi_app/screens/home/detail_menu.dart';
import '../../models/menu_card.dart';


class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  static const Color mainOrange = Color.fromARGB(255, 255, 87, 34);

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
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EB),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
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
                    backgroundColor: Colors.deepOrange,
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
          Expanded(
            child: GridView.builder(
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
                  Text("Total: Rp ${_totalHarga().toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.')}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    onPressed: () {
                      // Ambil satu menu pertama dari keranjang
                      final firstTitleInCart = cart.keys.first;
                      final selectedMenu = menuItems.firstWhere((item) => item['title'] == firstTitleInCart);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => OrderDetailScreen(selectedMenu: selectedMenu),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Text("Pesan Sekarang", style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}