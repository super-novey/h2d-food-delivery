import 'package:flutter/material.dart';
import 'socket_service.dart';

class RestaurantOrdersPage extends StatefulWidget {
  final SocketService socketService;
  final String restaurantId;

  const RestaurantOrdersPage(
      {Key? key, required this.socketService, required this.restaurantId})
      : super(key: key);

  @override
  _RestaurantOrdersPageState createState() => _RestaurantOrdersPageState();
}

class _RestaurantOrdersPageState extends State<RestaurantOrdersPage> {
  List<dynamic> _orders = [];

  @override
  void initState() {
    super.initState();

    // Join the restaurant's specific room to receive updates
    widget.socketService.joinRoom(widget.restaurantId);

    // Listen for new orders
    widget.socketService.onOrderNew((newOrder) {
      setState(() {
        _orders.add(newOrder); // Add the new order to the list
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Orders'),
      ),
      body: _orders.isEmpty
          ? Center(child: Text('No orders yet'))
          : ListView.builder(
              itemCount: _orders.length,
              itemBuilder: (context, index) {
                final order = _orders[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('Order ID: ${order['_id']}'),
                    subtitle: Text('Fee: ${order['deliveryFee']}'),
                    trailing: Text('Note: \$${order['note']}'),
                  ),
                );
              },
            ),
    );
  }
}
