part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsBottomNavBarState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsSuccessState extends NewsState {}

class NewsSearchSuccessState extends NewsState {}

class NewsSearchLoadingState extends NewsState {}
