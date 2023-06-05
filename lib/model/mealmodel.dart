class meal_model {
  final dynamic id;
  final dynamic name;
  final dynamic description;
  final dynamic providers;
  final dynamic status;
  meal_model({
    required this.id,
    required this.name,
    required this.description,
    required this.providers,
    required this.status,
  });

  factory meal_model.fromJson(Map<String, dynamic> json) {
    return meal_model(
      id: json['id'] as dynamic,
      name: json['name'] as dynamic,
      description: json['description'] as dynamic,
      providers: json['providers'] as dynamic,
      status: json['status'] as dynamic,
    );
  }
}
