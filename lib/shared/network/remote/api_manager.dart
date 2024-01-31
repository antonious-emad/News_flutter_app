import 'dart:convert';

import 'package:fourth/models/news_response.dart';
import 'package:fourth/models/sources_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiManager{

  static Future<SourcesModel> getSources(String catId) async{
    Uri url=Uri.https("newsapi.org","/v2/top-headlines/sources", {"apikey":"f32db8ad7be6485cac65d71c7b855db5","category":catId });
     Response response=await http.get(url);
     var jsonData=jsonDecode(response.body);
     SourcesModel sourcesdata=SourcesModel.fromJson(jsonData);
     return sourcesdata;
  }

  static Future<NewsResponse> getNews(String sourceID) async{
    Uri url=Uri.https("newsapi.org","/v2/everything",{
      "apiKey":"f32db8ad7be6485cac65d71c7b855db5",
      "sources":sourceID
    });
    Response response=await http.get(url) ;
    var jsondata=jsonDecode(response.body);
    NewsResponse news=NewsResponse.fromJson(jsondata);
    return news;
  }


}