class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final double discountPrice;
  final double rate;
  final String imageUrl;
  final bool isFavourite;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discountPrice,
    required this.rate,
    required this.imageUrl,
    required this.isFavourite,
  });
}