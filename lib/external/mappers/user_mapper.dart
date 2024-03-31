import '../../domain/entities/user_entity.dart';

class UserMapper {
  static UserEntity fromMap(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      name: json['name'],
    );
  }

  static Map<String, dynamic> toMap(UserEntity user) {
    return {
      'id': user.id,
      'name': user.name,
    };
  }

  static UserEntity get fakeEntity => UserEntity.fake();

  static List<UserEntity> fakeEntityList(int lenght) {
    return UserEntity.fakeList(lenght);
  }
}
