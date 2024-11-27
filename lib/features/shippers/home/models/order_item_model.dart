class OrderItem {
  String itemId;
  int quantity;
  double price;
  double totalPrice;

  OrderItem({
    required this.itemId,
    required this.quantity,
    required this.price,
    required this.totalPrice,
  });

  // Convert OrderItem object to JSON
  Map<String, dynamic> toJson() {
    return {
      'itemId': itemId,
      'quantity': quantity,
      'price': price,
      'totalPrice': totalPrice,
    };
  }

  // Factory constructor to create an OrderItem from JSON
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      itemId: json['itemId'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: (json['price'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
    );
  }

  @override
  String toString() {
    return 'OrderItem('
        'itemId: $itemId, '
        'quantity: $quantity, '
        'price: $price, '
        'totalPrice: $totalPrice'
        ')';
  }
}
