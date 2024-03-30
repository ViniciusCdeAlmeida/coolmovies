import '../../domain/entities/movie_list_entity.dart';

class MovieListMapper {
  static MovieListEntity fromMap(Map<String, dynamic> json) {
    return MovieListEntity(
      id: json['id'],
      title: json['title'],
      image: json['imgUrl'],
    );
  }
}
