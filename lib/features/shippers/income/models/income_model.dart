class IncomeModel {
  final String driverId;
  final int totalDeliveryFee;
  final int deliveredOrdersCount;
  final int cancelledOrdersCount;

  IncomeModel({
    required this.driverId,
    required this.totalDeliveryFee,
    required this.deliveredOrdersCount,
    required this.cancelledOrdersCount,
  });

  // Factory constructor to create a DriverStats from JSON data
  factory IncomeModel.fromJson(Map<String, dynamic> json) {
    return IncomeModel(
      driverId: json['driverId'],
      totalDeliveryFee: json['totalDeliveryFee'] ?? 0,
      deliveredOrdersCount: json['deliveredOrdersCount'] ?? 0,
      cancelledOrdersCount: json['cancelledOrdersCount'] ?? 0,
    );
  }

  // Method to convert the DriverStats object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'driverId': driverId,
      'totalDeliveryFee': totalDeliveryFee,
      'deliveredOrdersCount': deliveredOrdersCount,
      'cancelledOrdersCount': cancelledOrdersCount,
    };
  }
}
