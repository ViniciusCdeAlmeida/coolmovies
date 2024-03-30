import '../../domain/entities/movie_detail_entity.dart';
import 'movie_review_mapper.dart';

class MovieDetailMapper {
  static MovieDetailEntity fromMap(Map<String, dynamic> json) {
    return MovieDetailEntity(
      id: json['id'],
      image: json['imgUrl'],
      releaseDate: json['releaseDate'],
      title: json['title'],
      movieReviews:
          (json['movieReviewsByMovieId']['nodes'] as Iterable? ?? []).map((e) => MovieReviewMapper.fromMap(e)).toList(),
    );
  }
}
