import 'package:flutter/material.dart';
import 'package:kumaranaudioplayer/Pages/HomePage.dart';
import 'package:kumaranaudioplayer/Pages/audio_page.dart';


void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Kumaran Audio Player",
  home: MyApp(),
));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AudioPage();
  }
}
