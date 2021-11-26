import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _introScreenBuilder(context),
      )
    );
  }
}

Widget _introScreenBuilder(BuildContext context){
  return IntroductionScreen(
      pages: [vm1, vm2, vm3],
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      showNextButton: false,
      onDone: () {
        Navigator.pop(context);
      });
}

var vm1 = PageViewModel(
    title: "Title of first page",
    body:
        "Here you can write the description of the page, to explain someting...",
    image: Center(
      child: Image.network(
          "https://images.unsplash.com/photo-1551024601-bec78aea704b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZG9udXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
          height: 450.0,fit: BoxFit.fill, alignment: Alignment.center),
    ));

var vm2 = PageViewModel(
    title: "Title of first page",
    body:
        "Here you can write the description of the page, to explain someting...",
    image: Center(
      child: Image.network("https://images.unsplash.com/photo-1612240498936-65f5101365d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRvbnV0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
          height: 450.0,fit: BoxFit.fill, alignment: Alignment.center),
    ));

var vm3 = PageViewModel(
    title: "Title of first page",
    body:
        "Here you can write the description of the page, to explain someting...",
    image: Center(
      child: Image.network("https://images.unsplash.com/photo-1618411640018-972400a01458?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGRvbnV0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
          height: 450.0,fit: BoxFit.fill, alignment: Alignment.center),
    ));
