import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:unsplash_flutter/unsplashPhoto.dart';

Future<String> getRandomPhotos() async {
  var getRandomPhotoUrl = Uri.parse(
    'https://api.unsplash.com/photos/random',
  );
  var response = await http.get(getRandomPhotoUrl, headers: {
    "Authorization":
        "Client-ID bd62126574d597fdf8368caf9a5c9a1cd745d48952777cce8109a083cf8bfe1d"
  });

  UnsplashPhoto photo = UnsplashPhoto.fromJson(jsonDecode(response.body));
  return photo.urls?.regular ?? "";
}
