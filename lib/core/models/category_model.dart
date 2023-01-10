class Category {
  String? icon;
  String? name;
  Category({
    this.icon,
    this.name,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;

    return data;
  }

  Category.fromJson(
    json,
  ) {
    name = json['name'];
    icon = json['icon'];
  }
}
