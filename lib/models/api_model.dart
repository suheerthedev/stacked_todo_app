class ApiModel {
  final int? id;
  final String? name;
  final String? body;
  final bool? deleted;

  ApiModel({
    required this.id,
    required this.name,
    required this.body,
    required this.deleted,
  });

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
      id: json['id'],
      name: json['name'],
      body: json['comments'],
      deleted: json['deleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'comments': body,
      'deleted': deleted,
    };
  }
}
