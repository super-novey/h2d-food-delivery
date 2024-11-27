import 'package:food_delivery_h2d/features/shippers/home/models/order_item_model.dart';

class Order {
  String id;
  String customerName;
  String restaurantName;
  String? assignedShipperId;
  double? custShipperRating;
  double? deliveryFee;
  DateTime orderDatetime;
  String note;
  double? custResRating;
  String reason;
  String status;
  String? driverStatus;
  String? partnerStatus;
  List<OrderItem> orderItems;

  Order({
    this.id = '',
    required this.customerName,
    required this.restaurantName,
    this.assignedShipperId,
    this.custShipperRating,
    required this.deliveryFee,
    DateTime? orderDatetime,
    this.note = '',
    this.custResRating,
    this.reason = '',
    required this.status,
    this.driverStatus,
    this.partnerStatus,
    this.orderItems = const [],
  }) : orderDatetime = orderDatetime ?? DateTime.now();

  // Convert an Order object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerName': customerName,
      'restaurantName': restaurantName,
      'assignedShipperId': assignedShipperId,
      'custShipperRating': custShipperRating,
      'deliveryFee': deliveryFee,
      'orderDatetime': orderDatetime.toIso8601String(),
      'note': note,
      'custResRating': custResRating,
      'reason': reason,
      'status': status,
      'driverStatus': driverStatus,
      'partnerStatus': partnerStatus,
      'orderItems': orderItems.map((item) => item.toJson()).toList(),
    };
  }

  // Factory constructor to create an Order object from JSON
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] ?? '',
      customerName: json['customerName'] ?? 'Unknown',
      restaurantName: json['restaurantName'] ?? 'Unknown',
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
      status: json['status'] ?? 'new',
      driverStatus: json['driverStatus'],
      partnerStatus: json['partnerStatus'],
      orderItems: (json['orderItems'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
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
        'status: $status, '
        'driverStatus: $driverStatus, '
        'partnerStatus: $partnerStatus, '
        'orderItems: $orderItems'
        ')';
  }
}
