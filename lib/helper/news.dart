

import 'dart:convert';
import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News {

  List<ArticleModel> news  = [];

  Future<void> getNews() async{

    String url = "http://newsapi.org/v2/top-headlines?country=in&sortBy=publishedAt&language=en&apiKey=1930add188364321a7750c9d08159b7c";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(articleModel);
        }

      });
    }
  }
}

class CategoryNewsClass {

  List<ArticleModel> news  = [];

  Future<void> getNews(category) async{

    String url = "http://newsapi.org/v2/top-headlines?category=$category&country=in&sortBy=publishedAt&language=en&apiKey=1930add188364321a7750c9d08159b7c";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(articleModel);
        }

      });
    }
  }
}