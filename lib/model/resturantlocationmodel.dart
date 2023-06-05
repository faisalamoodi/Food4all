class resturantlocation_model {
  final dynamic id;
  final dynamic name;
  final dynamic phone;
  final dynamic email;
  final dynamic lat;
  final dynamic lng;

  resturantlocation_model({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.lat,
    required this.lng,
  });

  factory resturantlocation_model.fromJson(Map<String, dynamic> json) {
    return resturantlocation_model(
      id: json['id'] as dynamic,
      name: json['name'] as dynamic,
      phone: json['phone'] as dynamic,
      email: json['email'] as dynamic,
      lat: json['lat'] as dynamic,
      lng: json['lng'] as dynamic,
    );
  }
}
