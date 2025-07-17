import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final int price;
  final String image;
  final String description;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const MenuCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.quantity,
    required this.onAdd,
    required this.onRemove, required Null Function() onViewDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(image, height: 100, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("Rp ${price.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.')}"),
            const SizedBox(height: 4),
            Text(description, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12)),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
                Text('$quantity'),
                IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}