part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoadingList extends NewsState {}

class NewsLoadedList extends NewsState {
  final News news;

  NewsLoadedList(this.news);
}
