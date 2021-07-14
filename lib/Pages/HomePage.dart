import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kumaranaudioplayer/Pages/my_tabs.dart';
import 'package:kumaranaudioplayer/Widgets/app_colors.dart' as AppColors;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late List popularAlbums;
  late ScrollController _scrollController;
  late TabController _tabController;

  ReadData() async {
     await  DefaultAssetBundle.of(context).loadString(
        "assets/json/popularAlbums.json").
    then((s){
      setState(() {
        popularAlbums= json.decode(s);
        _tabController=TabController(length: 3, vsync: this);
        _scrollController=ScrollController();
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
            Expanded(child: NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder: (BuildContext context,bool isScroll){
                  return [
                    SliverAppBar(
                      pinned: true,
                        backgroundColor:AppColors.silverBackground,
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(50),
                        child:Container(
                          margin: const EdgeInsets.all(0),
                          child: TabBar(
                              indicatorPadding: const EdgeInsets.only(bottom:20 ),
                              indicatorSize:TabBarIndicatorSize.label ,
                              labelPadding: const EdgeInsets.only(right: 10),
                              controller: _tabController,
                              isScrollable: true,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 7,
                                    offset: Offset(0,0)
                                  )
                                ]
                              ),
                              tabs: [
                                MyTabs(color: AppColors.menu1Color, text: "New"),
                                MyTabs(color: AppColors.menu2Color, text: "Popular"),
                                MyTabs(color: AppColors.menu3Color, text: "Trending"),
                              ]),
                        ) ,
                      ),
                    )
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                    children: [
                  Material(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      title: Text("Content"),
                    ),
                  ),
                  Material(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      title: Text("Content"),
                    ),
                  ),
                  Material(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      title: Text("Content"),
                    ),
                  ),
                ])))

          ],
        ),
      )),
    );
  }
}
