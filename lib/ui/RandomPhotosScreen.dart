import 'package:flutter/material.dart';
import 'package:unsplash_flutter/ui/PhotoDetails.dart';
import 'package:unsplash_flutter/repo/repository.dart';
import 'package:unsplash_flutter/repo/unsplashPhoto.dart';
import 'package:unsplash_flutter/ui/WelcomeScreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: MainContainer(title: 'Unsplash Api photos'),
    );
  }
}

class MainContainer extends StatefulWidget {
  MainContainer({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MainContainerState createState() => _MainContainerState();
}

Widget _unsplashImageDialogBuilder(
    BuildContext context, UnsplashPhoto imageDto) {
  return SimpleDialog(children: [
    Container(
      width: 500,
      height: 600,
      child: Image.network(imageDto.urls?.regular ?? "", fit: BoxFit.fitHeight),
    )
  ]);
}

class _MainContainerState extends State<MainContainer> {
  List<Widget> _images = [];

  Future<Null> getPhotos() async {
    var photosDto = await getRandomPhotos(30);
    print(photosDto[0].urls?.raw ?? "");
    setState(() {
      _images = unsplashDtoToWidget(
          photosDto,
          (unsplashPhoto) => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PhotoDetails(unsplashPhoto)))
              },
          (unsplashPhoto) => {
                showDialog(
                    context: context,
                    builder: (context) =>
                        _unsplashImageDialogBuilder(context, unsplashPhoto))
              });
    });
  }

  Future<Null> toWelcome(BuildContext context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => IntroScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
          onRefresh: getPhotos,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GridView.count(
                crossAxisCount: (constraints.maxWidth / 150).toInt(),
                children: _images,
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toWelcome(context),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}


/// Создаём сетку фоток
List<Widget> unsplashDtoToWidget(
    List<UnsplashPhoto> dto,
    void Function(UnsplashPhoto) onImageClick,
    void Function(UnsplashPhoto) onImageLongPress) {
  var allGridChildren = dto
      .map((item) => Container(
          margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
          child: GestureDetector(
              child: Image.network(item.urls?.regular ?? "", fit: BoxFit.cover),
              onTap: () {
                onImageClick(item);
              },
              onLongPress: () {
                onImageLongPress(item);
              })))
      .toList();

  int childrenSize = allGridChildren.length;
  var finalChildrens = <Widget>[];

  for (int index = 0; index < childrenSize; index++) {
    if ((index + 1) % 3 == 0 || index == 0) {
      finalChildrens.add(allGridChildren[index]);
    } else if (childrenSize >= index + 4) {
      finalChildrens.add(
          createMiniGridOfImages(allGridChildren.sublist(index, index + 4)));
      index += 3;
    } else finalChildrens.add(allGridChildren[index]);
  }
  return finalChildrens;
}

Widget createMiniGridOfImages(List<Widget> photos) {
  return GridView.count(
      crossAxisCount: 2,
      children: photos,
      physics: NeverScrollableScrollPhysics());
}
