import 'package:coolmovies/domain/entities/movie_list_entity.dart';
import 'package:coolmovies/external/mappers/movie_list_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovieListMapper', () {
    late MovieListEntity fakeEntity;
    late List<MovieListEntity> fakeEntityList;

    setUp(() {
      fakeEntity = MovieListMapper.fakeEntity;
      fakeEntityList = MovieListMapper.fakeEntityList(2);
    });

    test('Converts valid map into MovieListEntity', () {
      final validMap = {
        'id': fakeEntity.id,
        'title': fakeEntity.title,
        'imgUrl': fakeEntity.image,
      };

      final result = MovieListMapper.fromMap(validMap);

      expect(result.id, fakeEntity.id);
      expect(result.title, fakeEntity.title);
      expect(result.image, fakeEntity.image);
    });

    test('Generates fake MovieListEntity', () {
      expect(fakeEntity, isA<MovieListEntity>());
    });

    test('Generates list of fake MovieListEntities', () {
      expect(fakeEntityList.length, 2);
    });

    tearDown(() {});
  });
}
