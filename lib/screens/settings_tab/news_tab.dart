import 'package:flutter/material.dart';
import '../../shared/network/remote/api_manager.dart';
import '../tab_controller_widget.dart';

class NewsTab extends StatelessWidget {
  String CategoryId;
  NewsTab(this.CategoryId,{super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(CategoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {return Center(child: Text("Something went wrong"));}
        var sourceslist = snapshot.data?.sources ?? [];
        return TabControllerWidget(sourceslist);

        // ListView.builder(itemBuilder: (context, index) {
        //     return Text(sourceslist[index].name ?? "");
        //   }, itemCount: sourceslist.length);
      },
    );
  }
}
