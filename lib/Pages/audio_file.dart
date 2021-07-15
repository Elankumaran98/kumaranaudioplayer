import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer audioPlayer;
  const AudioFile({Key? key,required this.audioPlayer}) : super(key: key);
  @override
  _AudioFileState createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration=new Duration();
  Duration _position=new Duration();
  final String path="https://st.bslmeiyu.com/uploads/%e6%9c%97%e6%96%87%e5%9b%bd%e9%99%85SBS%e7%b3%bb%e5%88%97/%e6%9c%97%e6%96%87%e5%9b%bd%e9%99%85%e8%8b%b1%e8%af%ad%e6%95%99%e7%a8%8b%e7%ac%ac1%e5%86%8c_V2/%e5%ad%a6%e7%94%9f%e7%94%a8%e4%b9%a6/P149_Chapter%2016_Vocabulary%20Preview.mp3";
  bool isPlaying=false;
  bool isPaused=false;
  bool isLoop=false;
  List<IconData> _icons=[
    Icons.play_circle_filled,
    Icons.pause_circle_filled
  ];
  @override
  void initState(){
    super.initState();
    this.widget.audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration=d;
    }); });
    this.widget.audioPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        _position=p;
    }); });

    this.widget.audioPlayer.setUrl(path);
  }
  
  
  Widget btnStart(){
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10),
        icon: isPlaying==false? Icon(_icons[0]):Icon(_icons[1]),
      onPressed: (){
        if(isPlaying==false){
          this.widget.audioPlayer.play(path);
          setState(() {
            isPlaying=true;
          });
        }
        else if(isPlaying==true){
          this.widget.audioPlayer.pause();
          setState(() {
            isPlaying=false;
          });
        }

      },);
  }

  Widget loadAsset(){
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnStart()
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
          ),
          loadAsset()
        ],
      ),
    );
  }
}
