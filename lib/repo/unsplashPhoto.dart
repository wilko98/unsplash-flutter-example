import 'package:http/http.dart' as http;
import 'dart:convert';

class UnsplashPhoto {
  String? id;
  String? blurHash;
  String? description;
  String? altDescription;
  Urls? urls;
  int? likes;
  User? user;
  bool? likedByUser;
  int? views;
  int? downloads;

  UnsplashPhoto(
      {this.id,
      this.blurHash,
      this.description,
      this.altDescription,
      this.urls,
      this.likes,
      this.user,
      this.likedByUser,
      this.views,
      this.downloads});

  UnsplashPhoto.fromJson(Map<String, dynamic> json) {
    blurHash = json['blur_hash'];
    description = json['description'];
    altDescription = json['alt_description'];
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
    likes = json['likes'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    likedByUser = json['liked_by_user'];
    views = json['views'];
    downloads = json['downloads'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blur_hash'] = this.blurHash;
    data['description'] = this.description;
    data['alt_description'] = this.altDescription;
    if (this.urls != null) {
      data['urls'] = this.urls?.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    data['likes'] = this.likes;
    data['liked_by_user'] = this.likedByUser;
    data['views'] = this.views;
    data['downloads'] = this.downloads;
    return data;
  }
}

class Urls {
  String raw = "";
  String full = "";
  String regular = "";
  String small = "";
  String thumb = "";

  Urls(
      {required this.raw,
      required this.full,
      required this.regular,
      required this.small,
      required this.thumb});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['full'] = this.full;
    data['regular'] = this.regular;
    data['small'] = this.small;
    data['thumb'] = this.thumb;
    return data;
  }
}

class User {
  String? id = "";
  String? updatedAt = "";
  String? username = "";
  String? name = "";
  String? portfolioUrl = "";
  Links? links = null;

  User(
      {required this.id,
      required this.updatedAt,
      required this.username,
      required this.name,
      required this.portfolioUrl,
      this.links});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    portfolioUrl = json['portfolio_url'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    data['name'] = this.name;
    data['portfolio_url'] = this.portfolioUrl;
    if (this.links != null) {
      data['links'] = this.links?.toJson();
    }
    return data;
  }
}

class Links {
  String self = "";
  String html = "";
  String photos = "";
  String likes = "";
  String portfolio = "";

  Links(
      {required this.self,
      required this.html,
      required this.photos,
      required this.likes,
      required this.portfolio});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    photos = json['photos'];
    likes = json['likes'];
    portfolio = json['portfolio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['html'] = this.html;
    data['photos'] = this.photos;
    data['likes'] = this.likes;
    data['portfolio'] = this.portfolio;
    return data;
  }
}
