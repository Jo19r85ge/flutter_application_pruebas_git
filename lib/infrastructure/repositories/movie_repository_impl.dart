
import 'package:movie1/domain/datasources/movies_datasource.dart';
import 'package:movie1/domain/entities/movie.dart';
import 'package:movie1/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {

  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPaying({int page = 1}) {
    return datasource.getNowPaying(page: page);

  }

}