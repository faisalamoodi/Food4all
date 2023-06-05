class resturant_model {
  final dynamic id;
  final dynamic name;
  final dynamic phone;
  final dynamic email;
  resturant_model({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  factory resturant_model.fromJson(Map<String, dynamic> json) {
    return resturant_model(
      id: json['id'] as dynamic,
      name: json['name'] as dynamic,
      phone: json['phone'] as dynamic,
      email: json['email'] as dynamic,
    );
  }
}
