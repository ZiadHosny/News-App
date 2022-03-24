import 'package:news_app/models/news.dart';
import 'package:dio/dio.dart';

class NewsApi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2/top-headlines',
      queryParameters: {
        'country': 'eg',
        'apiKey': '828c1f95c6484243b1a56c8ce26e9754',
      },
    ),
  );
  Future<List<News>> getData(String category) async {
    final List<News> _allNews = [];
    var res = await _dio.get(
      '',
      queryParameters: {'category': category},
    );

    List data = res.data['articles'];

    for (var element in data) {
      News news = News(
        title: element['title'] ?? '',
        description: element['description'] ?? '',
        url: element['url'] ?? '',
        urlToImage: element['urlToImage'] ??
            'https://ericson-lab.com/wp-content/uploads/2017/08/nophoto.png',
        publishedAt: element['publishedAt'] ?? '',
      );

      _allNews.add(news);
    }

    return _allNews;
  }
}
