class StatisticModel {
  final String restaurantId;
  final int totalPrice;
  final int deliveredOrdersCount;
  final int cancelledOrdersCount;

  StatisticModel({
    required this.restaurantId,
    required this.totalPrice,
    required this.deliveredOrdersCount,
    required this.cancelledOrdersCount,
  });

  // Factory constructor to create a RestaurantRatingModel from JSON data
  factory StatisticModel.fromJson(Map<String, dynamic> json) {
    return StatisticModel(
      restaurantId: json['restaurantId'],
      totalPrice: json['totalPrice'] ?? 0,
      deliveredOrdersCount: json['deliveredOrdersCount'] ?? 0,
      cancelledOrdersCount: json['cancelledOrdersCount'] ?? 0,
    );
  }

  // Method to convert the RestaurantRatingModel object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'restaurantId': restaurantId,
      'totalPrice': totalPrice,
      'deliveredOrdersCount': deliveredOrdersCount,
      'cancelledOrdersCount': cancelledOrdersCount,
    };
  }
}
