class SourcesModel {
  SourcesModel({
      this.status,
      this.code,
      this.message,
      this.sources,});

  SourcesModel.fromJson(dynamic json) {
    status = json['status'];
    code=json['code'];
    message=json['message'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Sources.fromJson(v));
      });
    }
  }
  String? status;
  String? code;
  String? message;
  List<Sources>? sources;


}

class Sources {
  Sources({
      this.id, 
      this.name, 
      this.description, 
      this.url, 
      this.category, 
      this.language, 
      this.country,});

  Sources.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;


}