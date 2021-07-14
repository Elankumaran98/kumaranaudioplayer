import 'package:flutter/material.dart';
import 'package:kumaranaudioplayer/Widgets/app_colors.dart' as AppColors;


void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Kumaran Audio Player",
  home: MyApp(),
));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
            Container(
              height: 180,
              child: Stack(
                children: [
                  Positioned(
                    top:0,
                    left: 0,
                    right: 0,
                      child: Container(
                    height: 180,
                    child: PageView.builder(
                        controller: PageController(viewportFraction: 0.8),
                        itemCount: 5,
                        itemBuilder: (_,i){
                          return Container(
                            height: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(image: AssetImage("assets/imgs/pic-1.jpg"))
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
