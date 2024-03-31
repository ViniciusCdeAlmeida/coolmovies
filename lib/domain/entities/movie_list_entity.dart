import 'package:equatable/equatable.dart';
import 'package:faker/faker.dart';

class MovieListEntity extends Equatable {
  final String id;
  final String title;
  final String? image;

  const MovieListEntity({
    required this.id,
    required this.title,
    this.image,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        image,
      ];

  MovieListEntity copyWith({
    String? id,
    String? image,
    String? title,
  }) {
    return MovieListEntity(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
    );
  }

  @override
  String toString() {
    return '$runtimeType: { '
        '\tid: $id,\n'
        '\timage: $image,\n'
        '\ttitle: $title,\n'
        '}';
  }

  factory MovieListEntity.fake() {
    return MovieListEntity(
      id: faker.randomGenerator.integer(10).toString(),
      title: faker.randomGenerator.fromCharSet('ABCDEFGHIJKLMONPQESTUVWXYZ', 10),
      image: faker.image.image(),
    );
  }

  static List<MovieListEntity> fakeList(int length) {
    return List<MovieListEntity>.generate(
      length,
      (index) => MovieListEntity.fake(),
    );
  }
}
