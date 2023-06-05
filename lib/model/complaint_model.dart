class complaint_model {
  final dynamic id;
  final dynamic name;
  final dynamic content;
  final dynamic replay;
  final dynamic admins;

  complaint_model({
    required this.id,
    required this.name,
    required this.content,
    required this.replay,
    required this.admins,
  });

  factory complaint_model.fromJson(Map<String, dynamic> json) {
    return complaint_model(
      id: json['id'] as dynamic,
      name: json['name'] as dynamic,
      content: json['content'] as dynamic,
      replay: json['replay'] as dynamic,
      admins: json['admins'] as dynamic,
    );
  }
}
