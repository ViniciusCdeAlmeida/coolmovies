import '../../domain/entities/movie_list_entity.dart';

class MovieListMapper {
  static MovieListEntity fromMap(Map<String, dynamic> json) {
    return MovieListEntity(
      id: json['id'],
      title: json['title'],
      image: json['imgUrl'],
    );
  }

  static Map<String, dynamic> toMap(MovieListEntity movieReview) {
    return {
      'id': movieReview.id,
      'title': movieReview.title,
      'imgUrl': movieReview.image,
    };
  }

  static MovieListEntity get fakeEntity => MovieListEntity.fake();

  static List<MovieListEntity> fakeEntityList(int lenght) {
    return MovieListEntity.fakeList(lenght);
  }
}
