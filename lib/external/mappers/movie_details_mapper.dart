import '../../domain/entities/movie_detail_entity.dart';

class MovieDetailMapper {
  static MovieDetailEntity fromMap(Map<String, dynamic> json) {
    return MovieDetailEntity(
      id: json['id'],
      image: json['imgUrl'],
      releaseDate: json['releaseDate'],
      title: json['title'],
      movieReviews: const [],
    );
  }
}
