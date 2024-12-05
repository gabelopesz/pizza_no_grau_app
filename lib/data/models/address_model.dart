class Address {
  final String id;
  final String street;
  final String city;
  final String postalCode;
  final String country;

  Address({
    required this.id,
    required this.street,
    required this.city,
    required this.postalCode,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      street: json['street'],
      city: json['city'],
      postalCode: json['postalCode'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'street': street,
      'city': city,
      'postalCode': postalCode,
      'country': country,
    };
  }
}
