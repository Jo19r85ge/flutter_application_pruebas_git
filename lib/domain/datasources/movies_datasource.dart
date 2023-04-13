
import 'package:movie1/domain/entities/movie.dart';

abstract class MoviesDatasource {

  Future<List<Movie>> getNowPaying({ int page = 1 });

}