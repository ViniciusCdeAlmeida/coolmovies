import 'package:equatable/equatable.dart';

import 'movie_list_entity.dart';
import 'movie_review_entity.dart';

class MovieDetailEntity extends MovieListEntity implements EquatableMixin {
  final String releaseDate;
  final List<MovieReviewEntity> movieReviews;

  const MovieDetailEntity({
    required this.releaseDate,
    required this.movieReviews,
    required super.id,
    required super.title,
    super.image,
  });

  @override
  List<Object?> get props => [
        super.id,
        super.title,
        super.image,
        releaseDate,
        movieReviews,
      ];

  @override
  MovieDetailEntity copyWith({
    String? id,
    String? image,
    String? title,
    List<MovieReviewEntity>? movieReviews,
    String? releaseDate,
  }) {
    return MovieDetailEntity(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      releaseDate: releaseDate ?? this.releaseDate,
      movieReviews: movieReviews ?? this.movieReviews,
    );
  }

  @override
  String toString() {
    return '$runtimeType: { '
        '\tid: $id,\n'
        '\timage: $image,\n'
        '\ttitle: $title,\n'
        '\treleaseDate: $releaseDate,\n'
        '\tmovieReviews: $movieReviews,\n'
        '}';
  }
}
