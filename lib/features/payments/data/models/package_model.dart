class PackageModel {
  final int id;
  final String name;
  final double price;
  final double balanceAmount;

  PackageModel({
    required this.id,
    required this.name,
    required this.price,
    required this.balanceAmount,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'] as Map<String, dynamic>? ?? {};

    return PackageModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      name: attributes['name'] ?? '',
      price: double.tryParse(attributes['price'].toString()) ?? 0.0,
      balanceAmount:
          double.tryParse(attributes['balance_amount'].toString()) ?? 0.0,
    );
  }
}
