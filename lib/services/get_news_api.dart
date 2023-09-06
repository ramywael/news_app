import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class Service {
  final Dio dio;
  Service(this.dio);
  Future<List<ArticalModel>> getNews({required String category}) async {
    String apiKey = "f58bcc77c5da446987d2e504f85e86f2";
    Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey&category=$category");
    //in the dio package we donot have to convert the response to json
    //dio does it for us
    Map<String, dynamic> data = response.data; //data is a map
    List<dynamic> articles = data["articles"]; //articles is a list
    //articles is a list of maps
    //So we have to convert each map to a dart object
    //We will create a model for this
    //To make it easy to call it inside the app
    List<ArticalModel> articleList = [];
    for (var article in articles) {
      ArticalModel articalModel = ArticalModel(
          title: article["title"],
          description: article['description'],
          urlToImage: article['urlToImage'],
          url: article['url']);
      articleList.add(articalModel); //adding the article to the list
    }
    return articleList;
  }
}
