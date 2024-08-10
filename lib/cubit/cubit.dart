import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth/cubit/states.dart';
import 'package:fourth/models/news_response.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../models/sources_model.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitState());
  
  static HomeCubit get(context)=>BlocProvider.of(context);
  int selectedindex=0;
  List <Sources> sourceslist =  [];
  List <Articles> articlesList =  [];

  void changeSource(int vlaue){
    emit(HomeInitState());
    selectedindex=vlaue;
    emit(HomeChangeSourceState());
  }

  Future<void> getSources(String catId) async{
     emit(HomeGetSourcesLoadingState());
     Uri url=Uri.https("newsapi.org","/v2/top-headlines/sources", {"apikey":"f32db8ad7be6485cac65d71c7b855db5","category":catId });
    Response response=await http.get(url);
    try{
      var jsonData=jsonDecode(response.body);
      SourcesModel sourcesdata=SourcesModel.fromJson(jsonData);
      sourceslist = sourcesdata.sources ?? [];
      emit(HomeGetSourcesSucessState());
    }catch(e){
      emit(HomeGetSourcesErrorState());
      throw e;
    }
  }

   Future<NewsResponse> getNews(String sourceID) async{
     emit(HomeGetNewsDataLoadingState());
     Uri url=Uri.https("newsapi.org","/v2/everything",{
      "apiKey":"f32db8ad7be6485cac65d71c7b855db5",
      "sources":sourceID
    });
    Response response=await http.get(url) ;
    try{
      var jsondata=jsonDecode(response.body);
      NewsResponse news=NewsResponse.fromJson(jsondata);
      articlesList=news.articles??[];
      emit(HomeGetNewsDataSucessState());
      return news;
    }catch(e){
      emit(HomeGetNewsDataErrorState());
      throw e;
    }

  }


}