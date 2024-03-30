import 'package:equatable/equatable.dart';
import 'package:faker/faker.dart';

import 'user_entity.dart';

class MovieReviewEntity extends Equatable {
  final String id;
  final String title;
  final String body;
  final int count;
  final UserEntity user;

  const MovieReviewEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.count,
    required this.user,
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
    UserEntity? user,
  }) {
    return MovieReviewEntity(
      id: id ?? this.id,
      body: body ?? this.body,
      title: title ?? this.title,
      count: count ?? this.count,
      user: user ?? this.user,
    );
  }

  @override
  String toString() {
    return '$runtimeType: { '
        '\tid: $id,\n'
        '\tcount: $count,\n'
        '\tint: $int,\n'
        '\tbody: $body,\n'
        '\tuser: $user,\n'
        '}';
  }

  factory MovieReviewEntity.fake() {
    return MovieReviewEntity(
      id: faker.randomGenerator.string(10),
      title: faker.randomGenerator.string(10),
      body: faker.randomGenerator.string(70),
      count: faker.randomGenerator.integer(1),
      user: UserEntity.fake(),
    );
  }

  static List<MovieReviewEntity> fakeList(int length) {
    return List<MovieReviewEntity>.generate(
      length,
      (index) => MovieReviewEntity.fake(),
    );
  }
}
