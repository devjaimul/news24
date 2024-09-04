import 'dart:convert';

import 'package:http/http.dart';
import 'package:news24/model/news_model.dart';

class ApiServices {
  final allNews =
      'https://newsapi.org/v2/everything?q=bitcoin&apiKey=2e27926c6c2344d883b7be273b52be52';
  final breakingNews =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=2e27926c6c2344d883b7be273b52be52';

  Future<List<NewsModel>> getAllNews() async {
    try {
      Response response = await get(Uri.parse(allNews));

      if(response.statusCode==200){
        Map<String,dynamic> json=jsonDecode(response.body);
        List<dynamic> body=json['articles'];
        List<NewsModel> articlesList=body.map((item) => NewsModel.fromJson(item),).toList();
        return articlesList;
      }
      else{
        throw('Nothing Found');
      }
    } catch (e) {
      throw (e);
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      Response response = await get(Uri.parse(breakingNews));

      if(response.statusCode==200){
        Map<String,dynamic> json=jsonDecode(response.body);
        List<dynamic> body=json['articles'];
        List<NewsModel> articlesList=body.map((item) => NewsModel.fromJson(item),).toList();
        return articlesList;
      }
      else{
        throw('Nothing Found');
      }
    } catch (e) {
      throw (e);
    }
  }
}
