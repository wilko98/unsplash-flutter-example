import 'package:flutter/material.dart';
import 'package:unsplash_flutter/repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _mainImage = "";

  void _incrementCounter() async {
    var photo = await getRandomPhotos();
    setState(() {
      if (photo.isNotEmpty) _mainImage = photo;
    });
  }

  List<Widget> getImages() {
    List<Widget> images = [];
    for (var i = 0; i < 20; i++) {
      if (_mainImage.isNotEmpty)
        images.add(Image.network(_mainImage));
      else
        images.add(Image.asset("lib/assets/placeholder_image.jpg"));
    }
    return images;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: getImages(),
      ),
      // Row(children: [getMainImage(), getMainImage(), getMainImage()]),
      // Row(children: [getMainImage(), getMainImage(), getMainImage()]),
      // Row(children: [getMainImage(), getMainImage(), getMainImage()]),
      // Row(children: [getMainImage(), getMainImage(), getMainImage()]),
      // Row(children: [getMainImage(), getMainImage(), getMainImage()]),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
