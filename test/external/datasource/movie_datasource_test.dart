import 'package:coolmovies/domain/entities/movie_detail_entity.dart';
import 'package:coolmovies/domain/entities/movie_list_entity.dart';
import 'package:coolmovies/domain/entities/movie_review_entity.dart';
import 'package:coolmovies/external/datasources/movie_external_datasource.dart';
import 'package:coolmovies/external/mappers/movie_review_mapper.dart';
import 'package:coolmovies/external/queries/movie_queries.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';

import '../../mock/external/api_proxy_mock.mocks.dart';

void main() {
  final MockApiProxy apiProxy = MockApiProxy();
  final MovieExternalDatasource datasource = MovieExternalDatasource(apiProxy: apiProxy);
  final fakeEntity = MovieListEntity.fake();
  final fakeMovieEntity = MovieDetailEntity.fake();
  final fakeMovieReviewEntity = MovieReviewEntity.fake();

  group('#getMovies', () {
    test('Should return success and the data is in valid format', () async {
      when(
        apiProxy.query(
          QueryOptions(
            document: gql(
              MovieQueries.getMovies(),
            ),
          ),
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          source: QueryResultSource.network,
          data: {
            'allMovies': {
              'nodes': [
                {
                  'id': fakeEntity.id,
                  'title': fakeEntity.title,
                  'imgUrl': fakeEntity.image,
                }
              ],
            },
          },
          options: QueryOptions(
            document: gql(
              MovieQueries.getMovies(),
            ),
          ),
        ),
      );

      final response = await datasource.getMovies();

      expect(response, isNotEmpty);
      expect(response, isA<List<MovieListEntity>>());
    });
  });

  group('#getMovie', () {
    test('Should return success and the data is in valid format', () async {
      when(
        apiProxy.query(
          QueryOptions(
            document: gql(
              MovieQueries.getMovieDetails(id: fakeEntity.id),
            ),
          ),
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          source: QueryResultSource.network,
          data: {
            'movieById': {
              'id': fakeMovieEntity.id,
              'imgUrl': fakeMovieEntity.image,
              'releaseDate': fakeMovieEntity.releaseDate,
              'title': fakeMovieEntity.title,
              'movieReviewsByMovieId': {
                'nodes': fakeMovieEntity.movieReviews.map((review) => MovieReviewMapper.toMap(review)).toList(),
              }
            },
          },
          options: QueryOptions(
            document: gql(
              MovieQueries.getMovieDetails(id: fakeEntity.id),
            ),
          ),
        ),
      );

      final response = await datasource.getMovie(id: fakeEntity.id);

      expect(response.movieReviews, isNotEmpty);
      expect(response, isA<MovieDetailEntity>());
    });
  });

  group('#addReview', () {
    test('Should return success and the data is in valid format', () async {
      when(
        apiProxy.mutate(
          MutationOptions(
            document: gql(
              MovieQueries.addMovieReviews(
                title: fakeMovieReviewEntity.title,
                userId: fakeMovieReviewEntity.user.id,
                movieId: fakeMovieEntity.id,
                rating: fakeMovieReviewEntity.count,
                body: fakeMovieReviewEntity.body,
              ),
            ),
          ),
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          source: QueryResultSource.network,
          data: {
            'createMovieReview': {
              'movieReview': MovieReviewMapper.toMap(fakeMovieReviewEntity),
            },
          },
          options: MutationOptions(
            document: gql(
              MovieQueries.addMovieReviews(
                title: fakeMovieReviewEntity.title,
                userId: fakeMovieReviewEntity.user.id,
                movieId: fakeMovieEntity.id,
                rating: fakeMovieReviewEntity.count,
                body: fakeMovieReviewEntity.body,
              ),
            ),
          ),
        ),
      );

      final response = await datasource.addMovieReview(
        title: fakeMovieReviewEntity.title,
        userId: fakeMovieReviewEntity.user.id,
        movieId: fakeMovieEntity.id,
        rating: fakeMovieReviewEntity.count,
        body: fakeMovieReviewEntity.body,
      );

      expect(response, isNotNull);
      expect(response, isA<MovieReviewEntity>());
    });
  });

  group('#removeReview', () {
    test('Should return success and the data is in valid format', () async {
      when(
        apiProxy.mutate(
          MutationOptions(
            document: gql(
              MovieQueries.removeMovieReview(
                reviewId: fakeMovieReviewEntity.id,
              ),
            ),
          ),
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          source: QueryResultSource.network,
          data: null,
          options: MutationOptions(
            document: gql(
              MovieQueries.removeMovieReview(
                reviewId: fakeMovieReviewEntity.id,
              ),
            ),
          ),
        ),
      );

      await datasource.removeMovieReview(
        reviewId: fakeMovieEntity.id,
      );

      verify(datasource.removeMovieReview(
        reviewId: fakeMovieEntity.id,
      )).called(1);
    });
  });
}
