class MenuItem {
  final String title;
  final int price;
  final String image;

  MenuItem({
    required this.title,
    required this.price,
    required this.image,
  });

  String get formattedPrice => 'Rp ${price ~/ 1000}K';

  // Optional: JSON helper (kalau pakai API)
  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      title: json['title'],
      price: json['price'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'image': image,
    };
  }

  // Supaya bisa digunakan sebagai key di Map
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuItem &&
          runtimeType == other.runtimeType &&
          title == other.title;

  @override
  int get hashCode => title.hashCode;
}
