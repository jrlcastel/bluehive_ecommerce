// class Order {

//   final String productName;
//   final double price;
//   final int quantity;

//   Order({
//     required this.productName,
//     required this.price,
//     required this.quantity,
//   });



//   fromMapList({required List<Map<String, dynamic>> mapList}) {

//     List<Order> _orders = [];

//     for (var _orderMap in mapList) {
//       _orders.add(Order(
//         productName: _orderMap['name'],
//         price: _orderMap['price'],
//         quantity: _orderMap['quantity'],
//       ));
//     }}

// }