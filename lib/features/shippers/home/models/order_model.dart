import 'package:food_delivery_h2d/features/shippers/home/models/order_item_model.dart';

class Order {
  String orderId;
  String customerId;
  String? driverStatus;
  String? restaurantId;
  String? assignedShipperId;
  double? custShipperRating;
  double? deliveryFee;
  DateTime orderDatetime;
  String note;
  double? custResRating;
  String reason;
  String? custStatus;
  String? partnerStatus;
  List<OrderItem> orderItems;

  Order({
    this.orderId = '',
    required this.customerId,
    this.driverStatus,
    this.restaurantId,
    this.assignedShipperId,
    this.custShipperRating,
    required this.deliveryFee,
    DateTime? orderDatetime,
    this.note = '',
    this.custResRating,
    this.reason = '',
    this.custStatus,
    this.partnerStatus,
    this.orderItems = const [],
  }) : orderDatetime = orderDatetime ?? DateTime.now();

  // Convert an Order object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      '_id': orderId,
      'customer_id': customerId,
      'driver_status': driverStatus,
      'restaurant_id': restaurantId,
      'assigned_shipper_id': assignedShipperId,
      'cust_shipper_rating': custShipperRating,
      'delivery_fee': deliveryFee,
      'order_datetime': orderDatetime.toIso8601String(),
      'note': note,
      'cust_res_rating': custResRating,
      'reason': reason,
      'cust_status': custStatus,
      'partner_status': partnerStatus,
      'order_items': orderItems.map((item) => item.toJson()).toList(),
    };
  }

  // Factory constructor to create an Order object from JSON

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['_id'],
      customerId: json['customerId'],
      driverStatus: json['driverStatus'],
      restaurantId: json['restaurantId'],
      assignedShipperId: json['assignedShipperId'],
      custShipperRating: json['custShipperRating'] != null
          ? (json['custShipperRating'] as num).toDouble()
          : null,
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      note: json['note'],
      custResRating: json['custResRating'] != null
          ? (json['custResRating'] as num).toDouble()
          : null,
      reason: json['reason'] ?? '',
      custStatus: json['custStatus'],
      partnerStatus: json['partnerStatus'],
      orderDatetime: DateTime.parse(json['orderDatetime']),
      orderItems: (json['orderItems'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'Order('
        'orderId: $orderId, '
        'customerId: $customerId, '
        'driverStatus: $driverStatus, '
        'restaurantId: $restaurantId, '
        'assignedShipperId: $assignedShipperId, '
        'customerShipperRating: $custShipperRating, '
        'deliveryFee: $deliveryFee, '
        'orderDateTime: $orderDatetime, '
        'note: $note, '
        'customerRestaurantRating: $custResRating, '
        'reason: $reason, '
        'customerStatus: $custStatus, '
        'partnerStatus: $partnerStatus, '
        'orderItems: $orderItems'
        ')';
  }
}
