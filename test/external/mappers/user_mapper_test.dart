import 'package:coolmovies/domain/entities/user_entity.dart';
import 'package:coolmovies/external/mappers/user_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserMapper', () {
    late UserEntity fakeEntity;
    late List<UserEntity> fakeEntityList;

    setUp(() {
      fakeEntity = UserMapper.fakeEntity;
      fakeEntityList = UserMapper.fakeEntityList(6);
    });

    test('Converts valid map into UserEntity', () {
      final validMap = {
        'id': fakeEntity.id,
        'name': fakeEntity.name,
      };

      final result = UserMapper.fromMap(validMap);

      expect(result.id, fakeEntity.id);
      expect(result.name, fakeEntity.name);
    });

    test('Generates fake UserEntity', () {
      expect(fakeEntity, isA<UserEntity>());
    });

    test('Generates list of fake UserEntities', () {
      expect(fakeEntityList.length, 6);
    });

    tearDown(() {});
  });
}
