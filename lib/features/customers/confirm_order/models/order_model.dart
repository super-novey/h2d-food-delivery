import 'package:food_delivery_h2d/features/customers/confirm_order/models/order_item_model.dart';

class OrderModel {
  String id;
  String customerId;
  String restaurantId;
  String custAddress;
  double deliveryFee;
  DateTime orderDatetime;
  String note;
  List<OrderItem> orderItems;
  int totalPrice;
  String paymentMethod;
  String paymentStatus;

  OrderModel({
    this.id = '',
    this.customerId = '',
    this.restaurantId = '',
    this.custAddress = '',
    this.deliveryFee = 0,
    DateTime? orderDatetime,
    this.note = '',
    required this.orderItems,
    this.totalPrice = 0,
    this.paymentMethod = 'Cash',
    this.paymentStatus = 'pending',
  }) : orderDatetime = orderDatetime ?? DateTime.now();

  // Convert an Order object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'restaurantId': restaurantId,
      'custAddress': custAddress,
      'deliveryFee': deliveryFee,
      'orderDatetime': orderDatetime.toIso8601String(),
      'note': note,
      'orderItems': orderItems.map((item) => item.toJson()).toList(),
      'totalPrice': totalPrice,
      'paymentMethod': paymentMethod,
      'paymentStatus': paymentStatus,
    };
  }

  // Factory constructor to create an Order object from JSON
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? '',
      customerId: json['customerId'],
      restaurantId: json['restaurantId'],
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      orderDatetime: DateTime.parse(json['orderDatetime']),
      note: json['note'] ?? '',
      orderItems: (json['orderItems'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      custAddress: '',
      totalPrice: json['totalPrice'],
      paymentMethod: json['paymentMethod'] ?? 'Cash',
      paymentStatus: json['paymentStatus'] ?? 'pending',
    );
  }

  @override
  String toString() {
    return 'Order('
        'id: $id, '
        'customerId: $customerId, '
        'restaurantId: $restaurantId, '
        'deliveryFee: $deliveryFee, '
        'orderDatetime: $orderDatetime, '
        'note: $note, '
        'orderItems: $orderItems'
        'totalPrice: $totalPrice'
        ', paymentMethod: $paymentMethod, '
        'paymentStatus: $paymentStatus'
        ')';
  }
}
