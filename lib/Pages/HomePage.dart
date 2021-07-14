import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kumaranaudioplayer/Widgets/app_colors.dart' as AppColors;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List popularAlbums;

  ReadData() async {
     await  DefaultAssetBundle.of(context).loadString(
        "assets/json/popularAlbums.json").
    then((s){
      setState(() {
        popularAlbums= json.decode(s);
      });
    } );
  }
  @override
  void initState(){
    super.initState();
    ReadData();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20,right: 20),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageIcon(AssetImage("assets/imgs/menu.png"),size: 24,color: Colors.black,),
                  Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 10,),
                      Icon(Icons.notifications)
                    ],
                  )
                ],
              ) ,
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text("Popular Albums",style: TextStyle(fontSize: 30),))
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 180,
              child: Stack(
                children: [
                  Positioned(
                      top:0,
                      left: -20,
                      right: 0,
                      child: Container(
                        height: 180,
                        child: PageView.builder(
                            controller: PageController(viewportFraction: 0.8),
                            itemCount: popularAlbums==null?0:popularAlbums.length,
                            itemBuilder: (_,i){
                              return Container(
                                height: 180,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: AssetImage(popularAlbums[i]["img"]),
                                        fit: BoxFit.fill)
                                ),
                              );
                            }),
                      ))
                ],
              ),
            ),

          ],
        ),
      )),
    );
  }
}
