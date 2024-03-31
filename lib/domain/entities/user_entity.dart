import 'package:equatable/equatable.dart';
import 'package:faker/faker.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;

  const UserEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  UserEntity copyWith({
    String? id,
    String? name,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    return '$runtimeType: { '
        '\tid: $id,\n'
        '\tname: $name,\n'
        '}';
  }

  factory UserEntity.fake() {
    return UserEntity(
      id: faker.randomGenerator.integer(10).toString(),
      name: faker.person.name(),
    );
  }

  static List<UserEntity> fakeList(int length) {
    return List<UserEntity>.generate(
      length,
      (index) => UserEntity.fake(),
    );
  }
}
