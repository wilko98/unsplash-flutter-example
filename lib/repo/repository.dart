import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:unsplash_flutter/repo/unsplashPhoto.dart';

final String baseUrl = "api.unsplash.com";
final Map<String, String> defaultHeaders = {
  "Authorization":
      "Client-ID bd62126574d597fdf8368caf9a5c9a1cd745d48952777cce8109a083cf8bfe1d"
};

Future<http.Response> httpGet(String path, Map<String, String>? params) async =>
    await http.get(Uri.https(baseUrl, path, params),headers: defaultHeaders);

Future<List<UnsplashPhoto>> getRandomPhotos(int count) async {
  var queryParams = {"count": count.toString()};

  var response = await httpGet('/photos/random', queryParams);

  final List typed = json.decode(response.body);

  final List<UnsplashPhoto> images =
      typed.map((imageItem) => UnsplashPhoto.fromJson(imageItem)).toList();

  return images;
}

Future<List<UnsplashPhoto>> getWorksByAuthor(String username) async {
  var response = await httpGet("/users/$username/photos",null);
  print(response.body);
  final List typed = json.decode(response.body);

  final List<UnsplashPhoto> images =
  typed.map((imageItem) => UnsplashPhoto.fromJson(imageItem)).toList();

  return images;
}
