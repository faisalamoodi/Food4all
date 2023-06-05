class order_resturant_model {
  final dynamic id;
  final dynamic customer_id;
  final dynamic meal_id;
  final dynamic provider_id;
  final dynamic providers;
  final dynamic customers;
  final dynamic status;
  final dynamic cust_lat;
  final dynamic cust_lng;
  order_resturant_model({
    required this.id,
    required this.customer_id,
    required this.meal_id,
    required this.provider_id,
     required this.providers,
    required this.customers,
    required this.status,
    required this.cust_lat,
    required this.cust_lng,
    
  });

  factory order_resturant_model.fromJson(Map<String, dynamic> json) {
    return order_resturant_model(
      id: json['id'] as dynamic,
      customer_id: json['nacustomer_idme'] as dynamic,
      meal_id: json['meal_id'] as dynamic,
      provider_id: json['provider_id'] as dynamic,
      providers: json['providers'] as dynamic,
      customers: json['customers'] as dynamic,
      status: json['status'] as dynamic,
      cust_lat: json['cust_lat'] as dynamic,
      cust_lng: json['cust_lng'] as dynamic,
     
    );
  }
}
