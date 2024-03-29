import 'package:equatable/equatable.dart';

class MovieReviewEntity extends Equatable {
  final String id;
  final String name;

  const MovieReviewEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  MovieReviewEntity copyWith({
    String? id,
    String? name,
  }) {
    return MovieReviewEntity(
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
}
