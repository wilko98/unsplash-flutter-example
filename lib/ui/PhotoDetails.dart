import 'package:flutter/material.dart';
import 'package:unsplash_flutter/repo/unsplashPhoto.dart';
import 'package:unsplash_flutter/ui/AuthorWorksList.dart';

class PhotoDetails extends StatefulWidget {
  UnsplashPhoto? _photoArgs = null;

  PhotoDetails(UnsplashPhoto unsplashPhoto) {
    _photoArgs = unsplashPhoto;
  }

  @override
  State<StatefulWidget> createState() => _PhotoDetailsState(_photoArgs);
}

class _PhotoDetailsState extends State<PhotoDetails> {
  UnsplashPhoto? _photoArgs;

  _PhotoDetailsState(UnsplashPhoto? photoArgs) {
    _photoArgs = photoArgs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_photoArgs?.user?.id ?? _photoArgs?.user?.username ?? "")),
        body: Stack(children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                  child: Image.network(_photoArgs?.urls?.full ?? "",
                      fit: BoxFit.cover))),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 32),
                  child: Text(
                    _photoArgs?.user?.username ?? "К пользователю",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  )),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AuthorWorksList(_photoArgs!)))
              },
            ),
          )
        ]));
  }
}
