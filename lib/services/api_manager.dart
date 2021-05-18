import 'dart:convert';

import 'package:demoflutter_app/models/newsInfo.dart';
import 'package:http/http.dart' as http;
import 'package:demoflutter_app/constants/strings.dart';

class API_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel = NewsModel();
    try {
      var response = await client.get('https://newsapi.org/v2/everything?domains=wsj.com&apiKey=08ab1dbc5898498db95b195f6a45b6ba');

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
          newsModel = newsModelFromJson(jsonString);
      }
    } catch (Exception) {
      return newsModel;
    }
    return newsModel;
  }
}