import 'package:flutter/material.dart';
import 'package:unsplash_flutter/repo/unsplashPhoto.dart';
import 'package:unsplash_flutter/repo/repository.dart';
import 'PhotoDetails.dart';

class AuthorWorksList extends StatefulWidget {
  UnsplashPhoto? _photoArgs = null;

  AuthorWorksList(UnsplashPhoto unsplashPhoto) {
    _photoArgs = unsplashPhoto;
  }

  @override
  State<StatefulWidget> createState() => _AuthorWorksListState(_photoArgs);
}

class _AuthorWorksListState extends State<AuthorWorksList> {
  UnsplashPhoto? _photoArgs;
  List<Widget> _authorWorks = [];

  _AuthorWorksListState(UnsplashPhoto? photoArgs) {
    _photoArgs = photoArgs;
  }

  @override
  Widget build(BuildContext context) {
    getAuthorWorks(
      (work) => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PhotoDetails(work)))
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(_photoArgs?.user?.name ?? ""),
      ),
      body: Center(
        child: ListView(children: _authorWorks),
      ),
    );
  }

  void getAuthorWorks(void Function(UnsplashPhoto) onItemClick) async {
    var images = await getWorksByAuthor(_photoArgs?.user?.username ?? "");
    setState(
      () {
        _authorWorks = images
            .map(
              (item) => Container(
                margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                child: GestureDetector(
                  child: ListTile(
                      leading: Image.network(item.urls?.small ?? ""),
                      title: Text(item.description ?? "")),
                  onTap: () {
                    onItemClick(item);
                  },
                ),
              ),
            )
            .toList();
      },
    );
  }
}
