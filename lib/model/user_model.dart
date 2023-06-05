class user_model {
  final dynamic id;
  final dynamic firstname;
  final dynamic lastname;
  final dynamic phone;
  final dynamic email;
  user_model({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.email,
  });

  factory user_model.fromJson(Map<String, dynamic> json) {
    return user_model(
      id: json['id'] as dynamic,
      firstname: json['firstname'] as dynamic,
      lastname: json['lastname'] as dynamic,
      phone: json['phone'] as dynamic,
      email: json['email'] as dynamic,
    );
  }
}
