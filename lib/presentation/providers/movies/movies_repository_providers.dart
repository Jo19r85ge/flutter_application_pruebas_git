

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie1/domain/datasources/movies_datasource.dart';
import 'package:movie1/infrastructure/datasources/moviedb_datasource.dart';
import 'package:movie1/infrastructure/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) {

  //  return MovieRepositoryImpl( IMDBDatasource());
  return MovieRepositoryImpl( MovieDBDatasource());
}



);