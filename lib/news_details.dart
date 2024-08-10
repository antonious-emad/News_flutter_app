import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fourth/provider/my_provider.dart';
import 'package:fourth/shared/styles/colors.dart';
import 'package:fourth/web_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'models/news_response.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key});

  static const String routeName = "NewsDetails";

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)!.settings.arguments as Articles;
    var pro = Provider.of<MyProvider>(context);

    return Container(
        decoration: BoxDecoration(
            color: pro.mode == ThemeMode.light ? Colors.white : darkPrimary,
            image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"),
                opacity: 0.2,
                fit: BoxFit.fill)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white, size: 30),
              centerTitle: true,
              title: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(article.title ?? "",
                    style: GoogleFonts.exo(
                        color: onappbar,
                        fontWeight: FontWeight.w400,
                        fontSize: 22)),
              ),
              toolbarHeight: 67,
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50))),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: CachedNetworkImage(
                      imageUrl: article.urlToImage ?? "",
                      fit: BoxFit.fill,
                      height: 230,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress)),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(article.source!.name??"",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 10,color: Color(0xff79828b)),),
                  SizedBox(
                    height: 5,
                  ),
                  Text(article.title ?? "",
                      style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w500,
                          color: Color(0xff425050c)
                      )),
                  SizedBox(height: 5,),
                  Row(children: [
                        Expanded(
                          child: Text( "",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff42505c)
                              )),
                        ),
                        Text(article.publishedAt?.substring(0, 10) ?? "",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffA3A3A3)
                            )),
                      ]),
                  SizedBox(
                    height: 12,
                  ),
                  Text(article.description ?? "", style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w300,color: Color(0xff425050c))),
                  SizedBox(
                    height: 15,
                  ),
                  Row(children: [
                    Expanded(
                      child: Text( "",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff42505c)
                          )),
                    ),
                    Text( "View Full Article",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff42505c)
                        )
                    ),
                    IconButton(onPressed: (){
                      Navigator.pushNamed(context, WebViewScreen.routeName,arguments:article );
                    }, icon:Icon( Icons.play_arrow_sharp)),
                  ])
                ]),
              ),
            )));
  }
}
