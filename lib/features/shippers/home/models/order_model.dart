import 'package:food_delivery_h2d/features/shippers/home/models/order_item_model.dart';

class Order {
  String id;
  String customerName;
  String restaurantName;
  String restDetailAddress;
  String? assignedShipperId;
  double? custShipperRating;
  double? deliveryFee;
  DateTime orderDatetime;
  String note;
  double? custResRating;
  String reason;
  String custStatus;
  String? driverStatus;
  String? restStatus;
  List<OrderItem> orderItems;
  String? fullAddress;

  // Add the missing fields
  String? restProvinceId;
  String? restDistrictId;
  String? restCommuneId;

  Order({
    this.id = '',
    required this.customerName,
    required this.restaurantName,
    required this.restDetailAddress,
    this.assignedShipperId,
    this.custShipperRating,
    required this.deliveryFee,
    DateTime? orderDatetime,
    this.note = '',
    this.custResRating,
    this.reason = '',
    required this.custStatus,
    this.driverStatus,
    this.restStatus,
    this.orderItems = const [],
    this.fullAddress,
    this.restProvinceId, // Initialize restProvinceId
    this.restDistrictId, // Initialize restDistrictId
    this.restCommuneId, // Initialize restCommuneId
  }) : orderDatetime = orderDatetime ?? DateTime.now();

  // Convert an Order object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerName': customerName,
      'restaurantName': restaurantName,
      'restDetailAddress': restDetailAddress,
      'assignedShipperId': assignedShipperId,
      'custShipperRating': custShipperRating,
      'deliveryFee': deliveryFee,
      'orderDatetime': orderDatetime.toIso8601String(),
      'note': note,
      'custResRating': custResRating,
      'reason': reason,
      'custStatus': custStatus,
      'driverStatus': driverStatus,
      'restStatus': restStatus,
      'orderItems': orderItems.map((item) => item.toJson()).toList(),
      'fullAddress': fullAddress,
      'restProvinceId': restProvinceId,
      'restDistrictId': restDistrictId,
      'restCommuneId': restCommuneId,
    };
  }

  // Factory constructor to create an Order object from JSON
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] ?? '',
      customerName: json['customerName'] ?? 'Unknown',
      restaurantName: json['restaurantName'] ?? 'Unknown',
      restDetailAddress: json['restDetailAddress'] ?? 'Unknown',
      assignedShipperId: json['assignedShipperId'],
      custShipperRating: json['custShipperRating'] != null
          ? (json['custShipperRating'] as num).toDouble()
          : null,
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      orderDatetime: DateTime.parse(json['orderDatetime']),
      note: json['note'] ?? '',
      custResRating: json['custResRating'] != null
          ? (json['custResRating'] as num).toDouble()
          : null,
      reason: json['reason'] ?? '',
      custStatus: json['custStatus'] ?? 'waiting',
      driverStatus: json['driverStatus'],
      restStatus: json['restStatus'],
      orderItems: (json['orderItems'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      fullAddress: json['fullAddress'], // Parse the fullAddress field
      restProvinceId: json['restProvinceId'], // Parse the new field
      restDistrictId: json['restDistrictId'], // Parse the new field
      restCommuneId: json['restCommuneId'], // Parse the new field
    );
  }

  @override
  String toString() {
    return 'Order('
        'id: $id, '
        'customerName: $customerName, '
        'restaurantName: $restaurantName, '
        'assignedShipperId: $assignedShipperId, '
        'custShipperRating: $custShipperRating, '
        'deliveryFee: $deliveryFee, '
        'orderDatetime: $orderDatetime, '
        'note: $note, '
        'custResRating: $custResRating, '
        'reason: $reason, '
        'custStatus: $custStatus, '
        'driverStatus: $driverStatus, '
        'restStatus: $restStatus, '
        'orderItems: $orderItems, '
        'fullAddress: $fullAddress, '
        'restProvinceId: $restProvinceId, '
        'restDistrictId: $restDistrictId, '
        'restCommuneId: $restCommuneId'
        ')';
  }
}
