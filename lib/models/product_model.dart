class Product {
  final String name;
  final String price;
  final String imageUrl;
  final bool isBookmarked;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    this.isBookmarked = false,
  });

  Product copyWith({
    String? name,
    String? price,
    String? imageUrl,
    bool? isBookmarked,
  }) {
    return Product(
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}
