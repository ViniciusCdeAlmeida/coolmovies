import 'package:coolmovies/domain/entities/movie_review_entity.dart';

import '../entities/movie_detail_entity.dart';
import '../entities/movie_list_entity.dart';

abstract class IMovieRepository {
  Future<List<MovieListEntity>> getMovies({
    int page = 1,
    String search = '',
  });

  Future getUsers();

  Future<MovieDetailEntity> getMovie({
    required String id,
  });

  Future<MovieReviewEntity> addMovieReview({
    required String title,
    required String userId,
    required String movieId,
    int rating = 1,
    String body = '',
  });
}
