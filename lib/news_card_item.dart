import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fourth/models/news_response.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/sources_model.dart';

class NewsCardItem extends StatelessWidget {
  Articles article;
  NewsCardItem(this.article,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white.withOpacity(0.5),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.transparent)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                fit: BoxFit.fill,
                height: 230,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              // child: Image.network(articles.urlToImage??"",fit: BoxFit.fill,height:230 ,)
            ),

            // ClipRRect(borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(18),
            //   topRight: Radius.circular(18),
            // ), child:Image.network(article.urlToImage??"",height: 230,)),
            Padding(
              padding: const EdgeInsets.only(top:10 ,bottom: 10.0, right: 8, left: 8),
              child: Text(
                article.source!.id ?? "",
                style: GoogleFonts.poppins(fontSize:10, fontWeight: FontWeight.w400,color:Color(0xff79828B)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
              child: Text(
                article.title ?? "",
                style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500,color:Color(0xff42505C)  ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
            //   child: Text(
            //     article.description ?? "",
            //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            //     maxLines: 2,
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
              child: Row(
                children: [
                  Spacer(),
                  Text(article.publishedAt?.substring(0, 10) ?? "" , style:GoogleFonts.inter(fontSize: 13 ,fontWeight: FontWeight.w400,color: Color(0xffA3A3A3)) ,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
