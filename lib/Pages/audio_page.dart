import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kumaranaudioplayer/Widgets/app_colors.dart' as AppColors;
import 'package:kumaranaudioplayer/Pages/audio_file.dart';



class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  late AudioPlayer audioPlayer;

  @override
  void initState(){
    super.initState();
    audioPlayer=AudioPlayer();
  }
  Widget build(BuildContext context) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.audioBluishBackground,
      body: Stack(
        children: [
          Positioned(
            top: 0,
              right: 0,
              left: 0,
              height: screenHeight/4,
              child:
          Container(
            color: AppColors.audioBlueBackground,
          )),
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child:
          AppBar(
            leading: IconButton(
                onPressed: (){},
                icon: Icon(Icons.arrow_back_ios)),
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.search)),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
          )),
          Positioned(
            top: screenHeight*0.20,
              right: 0,
              left: 0,
              height: screenHeight*0.36,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight*0.1,
                    ),
                    Text("Music 1",style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "monoscope"
                    ),),
                    Text("AR Rahaman",style: TextStyle(
                      fontSize: 15,
                    ),),
                    AudioFile(audioPlayer:audioPlayer)
                  ],
                ),
              )),
          Positioned(
            top: screenHeight*0.12,
              left: (screenWidth-150)/2,
              right: (screenWidth-150)/2,
              height: screenHeight*0.16,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.audioGreyBackground,
                  border: Border.all(color: Colors.white,width: 2)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white,width: 5),
                      image: DecorationImage(
                        image: AssetImage("assets/imgs/arr-1.png"),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
          ))
        ],
      ),
    );
  }
}
