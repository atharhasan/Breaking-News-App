import 'package:bloc/bloc.dart';
import 'package:breaking_news/data/models/news.dart';
import 'package:breaking_news/data/repository/articales_repository.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final ArticlesRepository articlesRepository;
  NewsCubit(this.articlesRepository) : super(NewsInitial());

  getArticles() {
    articlesRepository.getArticles().then((news) {
      emit(NewsLoadedList(news));
    });
  }
}
