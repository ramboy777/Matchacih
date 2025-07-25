import 'package:flutter/material.dart';
import 'package:sushi_app/screens/home/detail_menu.dart';
import '../../models/menu_card.dart';

class OrderedItem {
  final String name;
  final int quantity;
  final int price;

  OrderedItem({required this.name, required this.quantity, required this.price});
}


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
    'title': "7-Piece Kappa's Choice Regular Set",
    'price': 81000,
    'image': "assets/img/7_piece_kappas_choice_regular_set.png",
    'description': "Medium-Fatty Tuna, Tuna, Squid, Whelk, Yellowtail, Salmon, Flounder Fin",
    'category': "Bundle"
  },
  {
    'title': "7-Piece Sushi",
    'price': 192000,
    'image': "assets/img/7_piece_sushi.png",
    'description': "Bonito, Abalone, Octopus, Urchin, Shrimp, Sea Eel",
    'category': "Bundle"
  },
  {
    'title': "Albacore Tuna",
    'price': 11000,
    'image': "assets/img/albacore_tuna.png",
    'description': "Ikan Tuna Albacore segar",
    'category': "Makan"
  },
  {
    'title': "Bering Sea Cockle",
    'price': 11000,
    'image': "assets/img/bering_sea_cockle.png",
    'description': "Kerang manis saus kecap dan wijen",
    'category': "Makan"
  },
  {
    'title': "Fresh Octopus",
    'price': 19000,
    'image': "assets/img/fresh_octopus.png",
    'description': "Gurita segar dengan cita rasa otentik",
    'category': "Makan"
  },
  {
    'title': "Japanese Omelette",
    'price': 11000,
    'image': "assets/img/japanese_omelette.png",
    'description': "Telur gulung khas Jepang",
    'category': "Makan"
  },
  {
    'title': "Popular Platter",
    'price': 89000,
    'image': "assets/img/popular_platter.png",
    'description': "Tuna, Albacore, Yellowtail, Salmon, Shrimp, Whelk",
    'category': "Bundle"
  },
  {
    'title': "Pounded Tuna",
    'price': 11000,
    'image': "assets/img/pounded_tuna.png",
    'description': "Tuna cincang segar",
    'category': "Makan"
  },
  {
    'title': "Salmon with Avocado",
    'price': 21000,
    'image': "assets/img/salmon_with_avocado.png",
    'description': "Salmon dengan alpukat creamy",
    'category': "Makan"
  },
  {
    'title': "Scallop",
    'price': 21000,
    'image': "assets/img/scallop.png",
    'description': "Kerang segar dari laut utara",
    'category': "Makan"
  },
  {
    'title': "Shrimp",
    'price': 11000,
    'image': "assets/img/shrimp.png",
    'description': "Udang segar lezat",
    'category': "Makan"
  },
  {
    'title': "Sushi Wrap with Tuna",
    'price': 11000,
    'image': "assets/img/sushi_wrap_with_tuna.png",
    'description': "Wrap tuna, daikon, perilla (dine-in only)",
    'category': "Makan"
  },
  {
    'title': "Tuna and Salmon",
    'price': 11000,
    'image': "assets/img/tuna_and_salmon.png",
    'description': "Dua kombinasi favorit: tuna dan salmon",
    'category': "Makan"
  },
  {
    'title': "Tuna and Shrimp Sushi",
    'price': 11000,
    'image': "assets/img/tuna_and_shrimp_sushi.png",
    'description': "Tuna dan udang segar",
    'category': "Makan"
  },
  {
    'title': "Tuna",
    'price': 11000,
    'image': "assets/img/tuna.png",
    'description': "Ikan tuna segar",
    'category': "Makan"
  },
  {
    'title': "Salmon Roe",
    'price': 39000,
    'image': "assets/img/salmon_roe.png",
    'description': "Telur salmon kualitas tinggi",
    'category': "Makan"
  },
  {
    'title': "Shrimp Tempura Roll",
    'price': 19000,
    'image': "assets/img/shrimp_tempura_roll.png",
    'description': "Gulungan udang goreng tempura",
    'category': "Makan"
  },
  {
    'title': "Soy Sauce Ramen",
    'price': 43000,
    'image': "assets/img/soy_sauce_ramen.png",
    'description': "Ramen kuah soyu klasik",
    'category': "Makan"
  },
  {
    'title': "Draft Beer",
    'price': 99000,
    'image': "assets/img/draft_beer.png",
    'description': "Bir dingin segar langsung dari tap",
    'category': "Minum"
  },
  {
    'title': "Alcohol-Free Cassis Orange",
    'price': 49000,
    'image': "assets/img/alcohol_free_cassis_orange.png",
    'description': "Minuman buah cassis tanpa alkohol",
    'category': "Minum"
  },
  {
    'title': "Iced Coffee",
    'price': 19000,
    'image': "assets/img/iced_coffee.png",
    'description': "Kopi dingin menyegarkan",
    'category': "Minum"
  },
  {
    'title': "Mango Drink",
    'price': 29000,
    'image': "assets/img/mango_drink.png",
    'description': "Minuman mangga manis",
    'category': "Minum"
  },
  {
    'title': "Masumi Dry Gold (Sake)",
    'price': 94000,
    'image': "assets/img/masumi_dry_gold_sake.png",
    'description': "Sake khas Jepang, tersedia di Jepang Timur",
    'category': "Minum"
  },
  {
    'title': "Premium Set (5 serving)",
    'price': 915000,
    'image': "assets/img/premium_set_5_serving.png",
    'description': "Set premium lengkap untuk 5 orang",
    'category': "Bundle"
  },
  {
    'title': "Premium Set (3 serving)",
    'price': 549000,
    'image': "assets/img/premium_set_3_serving.png",
    'description': "Set premium untuk 3 orang",
    'category': "Bundle"
  },
  {
    'title': "Happy Set (2 servings)",
    'price': 254000,
    'image': "assets/img/happy_set_2_servings.png",
    'description': "Paket happy untuk berdua",
    'category': "Bundle"
  },
  {
    'title': "Happy Set (one serving)",
    'price': 91000,
    'image': "assets/img/happy_set_1_serving.png",
    'description': "Set lengkap untuk satu orang",
    'category': "Bundle"
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
    final filteredItems =
        menuItems.where((item) => item['category'] == selectedCategory).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EB),
      appBar: AppBar(
        backgroundColor: mainOrange,
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.3),
        title: const Text(
          "Menu",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            child: Row(
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: selectedCategory == category ? Colors.white : Colors.black87,
                      backgroundColor: selectedCategory == category
                          ? mainOrange
                          : Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                final title = item['title'] as String;
                final quantity = cart[title] ?? 0;

                return MenuCard(
                  title: title,
                  price: item['price'] as int,
                  image: item['image'] as String,
                  description: item['description'] as String,
                  quantity: quantity,
                  onAdd: () => _addToCart(title),
                  onRemove: () => _removeFromCart(title),
                );
              },
            ),
          ),
          if (_totalItemInCart() > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${_totalItemInCart()} produk",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "Rp ${_totalHarga().toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.')}",
                        style: const TextStyle(
                          fontSize: 16, 
                          fontWeight: FontWeight.bold,
                          color: mainOrange
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final orderedItems = menuItems
                          .where((item) => cart[item['title']] != null && cart[item['title']]! > 0)
                          .map((item) {
                            return OrderedItem(
                              name: item['title'] as String,
                              quantity: cart[item['title']]!,
                              price: item['price'] as int,
                            );
                          }).toList();
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDetailScreen(orderedItems: orderedItems),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainOrange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Cek Keranjang", style: TextStyle(fontSize: 16)),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
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
