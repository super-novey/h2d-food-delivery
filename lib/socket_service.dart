import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket _socket;

  // Initialize socket connection
  void initializeSocket(String baseUrl) {
    _socket = IO.io(
      baseUrl,
      IO.OptionBuilder()
          .setTransports(['websocket']) // Specify transports
          .enableAutoConnect() // Enable auto connection
          .build(),
    );

    _socket.onConnect((_) {
      print('Connected to the socket server');
    });

    _socket.onDisconnect((_) {
      print('Disconnected from the socket server');
    });

    _socket.onError((data) {
      print('Socket error: $data');
    });
  }

  // Listen for 'order:new' event and update the order list
  void onOrderNew(Function(dynamic) callback) {
    _socket.on('order:new', (data) {
      // Convert the data to the appropriate format (assuming it is a JSON object)
      final order = jsonDecode(jsonEncode(data));
      callback(order); // Execute the callback with the new order
    });
  }

  // Join the specific room
  void joinRoom(String room) {
    _socket.emit('joinRoom', room);
  }

  // Disconnect from the socket
  void disconnect() {
    _socket.disconnect();
  }
}
