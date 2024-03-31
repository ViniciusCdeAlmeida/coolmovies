import 'package:coolmovies/domain/entities/movie_detail_entity.dart';
import 'package:coolmovies/external/mappers/movie_details_mapper.dart';
import 'package:coolmovies/external/mappers/movie_review_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovieDetailMapper', () {
    late MovieDetailEntity fakeEntity;
    late List<MovieDetailEntity> fakeEntityList;

    setUp(() {
      fakeEntity = MovieDetailMapper.fakeEntity;
      fakeEntityList = MovieDetailMapper.fakeEntityList(4); // Change the length as needed
    });

    test('Converts valid map into MovieDetailEntity', () {
      final validMap = {
        'id': fakeEntity.id,
        'title': fakeEntity.title,
        'releaseDate': fakeEntity.releaseDate,
        'imgUrl': fakeEntity.image,
        'movieReviewsByMovieId': {
          'nodes': fakeEntity.movieReviews.map((media) => MovieReviewMapper.toMap(media)).toList(),
        },
      };
      final result = MovieDetailMapper.fromMap(validMap);

      expect(result.id, fakeEntity.id);
      expect(result.title, fakeEntity.title);
      expect(result.releaseDate, fakeEntity.releaseDate);
      expect(result.image, fakeEntity.image);
      expect(result.movieReviews, fakeEntity.movieReviews);
    });

    test('Generates fake MovieDetailEntity', () {
      expect(fakeEntity, isA<MovieDetailEntity>());
    });

    test('Generates list of fake MovieDetailEntities', () {
      expect(fakeEntityList.length, 4);
    });

    tearDown(() {});
  });
}
