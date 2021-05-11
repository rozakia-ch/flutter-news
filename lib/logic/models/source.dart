class Sources {
  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

  Sources(
      {this.id, this.name, this.description, this.url, this.category, this.language, this.country});

  Sources.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }
}
