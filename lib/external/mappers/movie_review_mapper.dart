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
}
