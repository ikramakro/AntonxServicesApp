class Username {
  String? name;
  Username({
    this.name,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }

  Username.fromJson(
    json,
  ) {
    name = json['name'];
  }
}
