import 'package:equatable/equatable.dart';
import 'package:faker/faker.dart';

class MovieReviewEntity extends Equatable {
  final String id;
  final String title;
  final String body;
  final int count;

  const MovieReviewEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.count,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        body,
        count,
      ];

  MovieReviewEntity copyWith({
    String? id,
    String? title,
    String? body,
    int? count,
  }) {
    return MovieReviewEntity(
      id: id ?? this.id,
      body: body ?? this.body,
      title: title ?? this.title,
      count: count ?? this.count,
    );
  }

  @override
  String toString() {
    return '$runtimeType: { '
        '\tid: $id,\n'
        '\tcount: $count,\n'
        '\tint: $int,\n'
        '\tbody: $body,\n'
        '}';
  }

  factory MovieReviewEntity.fake() {
    return MovieReviewEntity(
      id: faker.randomGenerator.string(10),
      title: faker.randomGenerator.string(10),
      body: faker.randomGenerator.string(70),
      count: faker.randomGenerator.integer(1),
    );
  }

  static List<MovieReviewEntity> fakeList(int length) {
    return List<MovieReviewEntity>.generate(
      length,
      (index) => MovieReviewEntity.fake(),
    );
  }
}
