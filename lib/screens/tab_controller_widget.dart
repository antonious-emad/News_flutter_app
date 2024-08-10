import 'package:flutter/material.dart';
import 'package:fourth/news_card_item.dart';
import 'package:fourth/screens/source_item.dart';
import 'package:fourth/shared/network/remote/api_manager.dart';
import 'package:fourth/shared/styles/colors.dart';

import '../models/news_response.dart';
import '../models/sources_model.dart';

class TabControllerWidget extends StatefulWidget {
  List<Sources> sourcesList=[];

  TabControllerWidget(this.sourcesList, {super.key});

  @override
  State<TabControllerWidget> createState() => _TabControllerWidgetState();
}

class _TabControllerWidgetState extends State<TabControllerWidget> {
  int selectedindex=0;
  List<Articles>newsList=[];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(length: widget.sourcesList.length, child: TabBar(
          isScrollable: true,
          indicatorColor: Colors.transparent,
          onTap: (value) {selectedindex=value;setState(() {});},
          tabs: widget.sourcesList.map((onesource) => Tab(child: SourceItem(onesource,selectedindex==widget.sourcesList.indexOf(onesource)) ) ).toList() ,
        ) ),
        FutureBuilder(future: ApiManager.getNews(widget.sourcesList[selectedindex].id??""), builder:
            (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){return Center(child: CircularProgressIndicator());}
          if(snapshot.hasError){return Text("something went wrong");}
          var newsList=snapshot.data?.articles??[];
          return Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return NewsCardItem(newsList[index]);
            },itemCount: newsList.length,),
          );
        },

        )
      ],
    ) ;
  }
}
