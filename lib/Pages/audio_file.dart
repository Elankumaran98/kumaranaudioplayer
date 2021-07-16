import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final String audioPath;
  const AudioFile({Key? key,required this.audioPlayer,required this.audioPath}) : super(key: key);
  @override
  _AudioFileState createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration=new Duration();
  Duration _position=new Duration();
  bool isPlaying=false;
  bool isPaused=false;
  bool isRepeat=false;
  Color _color=Colors.black;
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

    this.widget.audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _position=Duration(seconds: 0);
        if(isRepeat==true){
          isPlaying=true;
        }
        isPlaying=false;
        isRepeat=false;
      });
    });

    this.widget.audioPlayer.setUrl(this.widget.audioPath);
  }
  
  
  Widget btnStart(){
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10),
        icon: isPlaying==false? Icon(_icons[0],size: 50,color: Colors.blue,)
            :Icon(_icons[1],size: 50,color: Colors.red,),
      onPressed: (){
        if(isPlaying==false){
          this.widget.audioPlayer.play(this.widget.audioPath);
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

  Widget btnLoop(){
    return IconButton(
        onPressed: (){
          this.widget.audioPlayer.setPlaybackRate(playbackRate: 1.5);
        },
        icon: ImageIcon(
          AssetImage("assets/imgs/loop.png"),
          color: Colors.black,
          size: 15,));
  }

  Widget btnFast(){
    return IconButton(
        onPressed: (){
          this.widget.audioPlayer.setPlaybackRate(playbackRate: 1.5);
        },
        icon: ImageIcon(
          AssetImage("assets/imgs/forward.png"),
          color: Colors.black,
          size: 15,));
  }

  Widget btnSlow(){
    return IconButton(
        onPressed: (){
          this.widget.audioPlayer.setPlaybackRate(playbackRate: 0.5);
        },
        icon: ImageIcon(
          AssetImage("assets/imgs/backword.png"),
          color: Colors.black,
          size: 15,));
  }

  Widget btnRepeat(){
    return IconButton(
        icon: ImageIcon(
          AssetImage("assets/imgs/repeat.png"),
          color: _color,
          size: 15,),
        onPressed: (){
          if(isRepeat==false){
            this.widget.audioPlayer.setReleaseMode(ReleaseMode.LOOP);
            setState(() {
              isRepeat=true;
              _color: Colors.blue;
            });
          }
          else if(isRepeat==true){
            this.widget.audioPlayer.setReleaseMode(ReleaseMode.RELEASE);
            _color=Colors.black;
          }
        },
       );
  }


  Widget loadAsset(){
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnLoop(),
          btnSlow(),
          btnStart(),
          btnFast(),
          btnRepeat()
        ],
      ),
    );
  }



  Widget slider(){
    return Slider(
      activeColor: Colors.red,
        inactiveColor: Colors.grey,
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        value: _position.inSeconds.toDouble(),
        onChanged: (double value){
      setState(() {
        changeToSecond(value.toInt());
        value=value;
      });
    });
  }

  void changeToSecond(int second){
    Duration newDuration=Duration(seconds: second);
    this.widget.audioPlayer.seek(newDuration);
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_position.toString().split(".")[0],style: TextStyle(fontSize: 16),),
                Text(_duration.toString().split(".")[0],style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
          slider(),
          loadAsset(),

        ],
      ),
    );
  }

}
