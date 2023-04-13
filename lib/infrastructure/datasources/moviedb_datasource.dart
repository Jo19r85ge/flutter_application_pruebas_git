

import 'package:dio/dio.dart';
import 'package:movie1/config/constants/environment.dart';
import 'package:movie1/domain/datasources/movies_datasource.dart';
import 'package:movie1/domain/entities/movie.dart';
import 'package:movie1/infrastructure/mappers/movie_mapper.dart';
import 'package:movie1/infrastructure/models/moviedb/moviedb_response.dart';

class MovieDBDatasource extends MoviesDatasource {

  // ignore: unused_local_variable
  final dio = Dio(BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        queryParameters: {
          'api_key': Environment.theMovieDbKey,
          'language': 'es-ES'
        }
      )
  );

  @override
  Future<List<Movie>> getNowPaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing');

    final movieDBResponse = MovieDbResponse.fromJson( response.data );
    
    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
      ).toList();

    
    return movies;
  }


}