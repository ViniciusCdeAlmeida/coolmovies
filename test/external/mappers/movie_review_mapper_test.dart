import 'package:coolmovies/domain/entities/movie_review_entity.dart';
import 'package:coolmovies/external/mappers/movie_review_mapper.dart';
import 'package:coolmovies/external/mappers/user_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovieListMapper', () {
    late MovieReviewEntity fakeEntity;
    late List<MovieReviewEntity> fakeEntityList;

    setUp(() {
      fakeEntity = MovieReviewMapper.fakeEntity;
      fakeEntityList = MovieReviewMapper.fakeEntityList(4); // Change the length as needed
    });

    test('Converts valid map into MovieReviewEntity', () {
      final validMap = {
        'id': fakeEntity.id,
        'title': fakeEntity.title,
        'body': fakeEntity.body,
        'rating': fakeEntity.count,
        'userByUserReviewerId': UserMapper.toMap(fakeEntity.user),
      };
      final result = MovieReviewMapper.fromMap(validMap);

      expect(result.id, fakeEntity.id);
      expect(result.title, fakeEntity.title);
      expect(result.body, fakeEntity.body);
      expect(result.count, fakeEntity.count);
      expect(result.user, fakeEntity.user);
    });

    test('Generates fake MovieReviewEntity', () {
      expect(fakeEntity, isA<MovieReviewEntity>());
    });

    test('Generates list of fake MovieReviewEntities', () {
      expect(fakeEntityList.length, 4);
    });

    tearDown(() {});
  });
}
