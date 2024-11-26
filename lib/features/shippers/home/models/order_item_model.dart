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
      'item_id': itemId,
      'quantity': quantity,
      'price': price,
      'total_price': totalPrice,
    };
  }

  // Factory constructor to create an OrderItem from JSON
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      itemId: json['item_id'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: (json['price'] as num).toDouble(),
      totalPrice: (json['total_price'] as num).toDouble(),
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
