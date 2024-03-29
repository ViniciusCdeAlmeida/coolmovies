import '../../domain/entities/user_entity.dart';

class NewProductsListMapper {
  static UserEntity fromMap(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      name: json['name'],
    );
  }
}
