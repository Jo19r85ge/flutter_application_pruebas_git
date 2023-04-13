
import 'package:movie1/presentation/providers/movies/movies_repository_providers.dart';

import '../../../domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){

final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getNowPaying;

return MoviesNotifier(

  fetchMoreMovies: fetchMoreMovies
);

});

typedef MovieCallBack = Future<List<Movie>> Function({ int page });


class MoviesNotifier extends StateNotifier<List<Movie>> {
  
  int currentPage = 0;
  MovieCallBack fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies,
  }): super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];


    

  }



}