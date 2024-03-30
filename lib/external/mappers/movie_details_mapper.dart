import '../../domain/entities/movie_detail_entity.dart';

class NewProductsListMapper {
  static MovieDetailEntity fromMap(Map<String, dynamic> json) {
    return MovieDetailEntity(
      id: json['id'],
      image: json['imageUrl'],
      releaseDate: json['releaseDate'],
      title: json['title'],
      movieReviews: const [],
    );
  }
}
