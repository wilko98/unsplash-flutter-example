import 'package:http/http.dart' as http;
import 'dart:convert';

class UnsplashPhoto {
  String? blurHash;
  String? description;
  String? altDescription;
  Urls? urls;
  int? likes;
  bool? likedByUser;
  int? views;
  int? downloads;

  UnsplashPhoto(
      {this.blurHash,
      this.description,
      this.altDescription,
      this.urls,
      this.likes,
      this.likedByUser,
      this.views,
      this.downloads});

  UnsplashPhoto.fromJson(Map<String, dynamic> json) {
    blurHash = json['blur_hash'];
    description = json['description'];
    altDescription = json['alt_description'];
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
    likes = json['likes'];
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
