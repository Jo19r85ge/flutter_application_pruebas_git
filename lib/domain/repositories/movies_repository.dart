
import 'package:movie1/domain/entities/movie.dart';

abstract class MoviesRepository {

  Future<List<Movie>> getNowPaying({ int page = 1 });

}