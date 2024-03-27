import 'package:equatable/equatable.dart';

class MovieListEntity extends Equatable {
  final String id;
  final String title;
  final String? image;

  const MovieListEntity({
    required this.id,
    required this.title,
    this.image,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        image,
      ];

  MovieListEntity copyWith({
    String? id,
    String? image,
    String? title,
  }) {
    return MovieListEntity(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
    );
  }

  @override
  String toString() {
    return '$runtimeType: { '
        '\tid: $id,\n'
        '\timage: $image,\n'
        '\ttitle: $title,\n'
        '}';
  }
}
