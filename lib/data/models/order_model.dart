class Order {
  final String id;
  final String date;
  final String status;
  final double total;
  final String addressId;
  final String paymentMethod;

  Order({
    required this.id,
    required this.date,
    required this.status,
    required this.total,
    required this.addressId,
    required this.paymentMethod,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      date: json['date'],
      status: json['status'],
      total: json['total'],
      addressId: json['addressId'],
      paymentMethod: json['paymentMethod'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'status': status,
      'total': total,
      'addressId': addressId,
      'paymentMethod': paymentMethod,
    };
  }
}
