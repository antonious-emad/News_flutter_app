import 'package:flutter/material.dart';
import 'package:fourth/screens/categories_tab.dart';
import 'package:fourth/screens/drawer.dart';
import 'package:fourth/screens/settings_tab/news_tab.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/category_model.dart';
import '../screens/settings_tab/settings_tab.dart';
import '../search_screen.dart';
import '../shared/styles/colors.dart';
class HomeLayout extends StatefulWidget {
  static const String routeName = "layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
int index=0;

List<CategoryModel> categories= CategoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(color: Colors.white, image: DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/images/pattern.png"))),

      child: Scaffold(
        drawer: SafeArea(
          child: DrawerTab(onDrawerClicked),
        ),
       backgroundColor: Colors.transparent,
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
            child:const Icon(
              Icons.search_rounded,
              size: 30,
            ),
          ),
          SizedBox(width: 20,),
        ],
        iconTheme: IconThemeData(color: Colors.white, size: 30),centerTitle: true, title: Padding(padding: EdgeInsets.all(8.0), child: Text("NEWS",style:GoogleFonts.exo(color: onappbar,fontWeight: FontWeight.w400,fontSize: 22) ),), toolbarHeight: 67, backgroundColor: Colors.green, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50))),),
       body:categorey==null && index ==0?CategoriesTab(categories,onCategoryClicked ): categorey !=null && index ==0? NewsTab(categorey!.id) :SettingsTab()  ,
      //  FutureBuilder(
      //   future: ApiManager.getSources(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //     if (snapshot.hasError) {return Center(child: Text("Something went wrong"));}
      //     var sourceslist = snapshot.data?.sources ?? [];
      //     return TabControllerWidget(sourceslist);
      //
      //     // ListView.builder(itemBuilder: (context, index) {
      //       //     return Text(sourceslist[index].name ?? "");
      //       //   }, itemCount: sourceslist.length);
      //   },
      // ),
      ),
    );
  }

  CategoryModel? categorey=null;

  onCategoryClicked(categeory){
    index=0;
    categorey=categeory;
    setState(() {});
  }

  onDrawerClicked(id) {
    if (id == DrawerTab.CAT_ID) {
      categorey = null;
      index=0;
    } else if (id == DrawerTab.SET_ID) {index=1;categorey=null;}
    setState(() {
      Navigator.pop(context);
    });
  }

}