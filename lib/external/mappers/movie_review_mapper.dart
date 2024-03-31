import '../../domain/entities/movie_review_entity.dart';
import 'user_mapper.dart';

class MovieReviewMapper {
  static MovieReviewEntity fromMap(Map<String, dynamic> json) {
    return MovieReviewEntity(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      count: json['rating'],
      user: UserMapper.fromMap(json['userByUserReviewerId']),
    );
  }

  static Map<String, dynamic> toMap(MovieReviewEntity movieReview) {
    return {
      'id': movieReview.id,
      'title': movieReview.title,
      'body': movieReview.body,
      'rating': movieReview.count,
      'userByUserReviewerId': UserMapper.toMap(movieReview.user),
    };
  }

  static MovieReviewEntity get fakeEntity => MovieReviewEntity.fake();

  static List<MovieReviewEntity> fakeEntityList(int lenght) {
    return MovieReviewEntity.fakeList(lenght);
  }
}
