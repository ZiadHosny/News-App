import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/models/news_api.dart';

import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/sports_screen.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  NewsApi newsApi = NewsApi();

  List<News> allBusinessNews = [];
  List<News> allSportsNews = [];
  List<News> allSciencesNews = [];
  List<News> allSearchNews = [];

  List<String> titles = [
    'Business',
    'Sports',
    'Science',
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'Science'),
  ];

  changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavBarState());
  }

  getNews(category) async {
    emit(NewsLoadingState());

    await newsApi.getData(category).then((value) {
      emit(NewsSuccessState());
      if (category == 'business') {
        allBusinessNews = value;
      } else if (category == 'science') {
        allSciencesNews = value;
      } else if (category == 'sports') {
        allSportsNews = value;
      }
    });
  }

  searchNews(String data) async {
    emit(NewsSearchLoadingState());

    await newsApi.searchData(data).then((value) {
      allSearchNews = value;
      emit(NewsSearchSuccessState());
    });
  }

  
}
