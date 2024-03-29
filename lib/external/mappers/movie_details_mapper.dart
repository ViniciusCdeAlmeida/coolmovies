import '../../domain/entities/movie_detail_entity.dart';

class NewProductsListMapper {
  static MovieDetailEntity fromMap(Map<String, dynamic> json) {
    return MovieDetailEntity(
      id: json['id'],
      image: json['imageUrl'],
      releaseDate: json['releaseDate'],
      title: json['title'],
      movieReviews: const [],
    );
  }

  // static NewProductsListEntity fake() {
  //   return NewProductsListEntity(
  //     id: faker.randomGenerator.integer(999999),
  //     code: faker.randomGenerator.integer(999999).toString(),
  //     name: faker.lorem.words(2).toString(),
  //     stock: faker.randomGenerator.integer(999999),
  //     color: faker.lorem.words(2).toString(),
  //     colorCode: faker.lorem.words(2).toString(),
  //     status: faker.randomGenerator.integer(999999),
  //     images: NewProductsMediasMapper.fakeList(2),
  //     skuCode: faker.randomGenerator.integer(999999).toString(),
  //   );
  // }

  // static List<NewProductsListEntity> fakeList(int length) {
  //   return List<NewProductsListEntity>.generate(
  //     length,
  //     (index) => fake(),
  //   );
  // }
}
