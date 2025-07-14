import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final int price;
  final String image;
  final String description;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onViewDetail;

  const MenuCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    required this.onViewDetail,
  });

  @override
  Widget build(BuildContext context) {
    const mainGreen = Color(0xFF74A12E);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  'Rp ${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                  style: const TextStyle(color: mainGreen, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: onRemove,
                      icon: const Icon(Icons.remove_circle_outline),
                      color: mainGreen,
                    ),
                    Text('$quantity'),
                    IconButton(
                      onPressed: onAdd,
                      icon: const Icon(Icons.add_circle_outline),
                      color: mainGreen,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: onViewDetail,
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
      ),
    );
  }
}

