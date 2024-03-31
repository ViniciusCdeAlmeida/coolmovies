import 'package:coolmovies/domain/usecase_providers.dart';
import 'package:coolmovies/domain/usecases/add_movie_review_usecase.dart';
import 'package:coolmovies/domain/usecases/get_movie_details_usecase.dart';
import 'package:coolmovies/domain/usecases/get_movie_list_usecase.dart';
import 'package:coolmovies/domain/usecases/get_users_usecase.dart';
import 'package:coolmovies/domain/usecases/remove_movie_review_usecase.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final providerContainer = ProviderContainer();
  late dynamic getUsersUsecaseProviderTest;
  late dynamic addReviewUsecaseProviderTest;
  late dynamic getMovieDetailsUsecaseProviderTest;
  late dynamic removeMovieReviewUsecaseProviderTest;
  late dynamic getMoviesListUsecaseProviderTest;
  await dotenv.load(fileName: ".env");
  setUpAll(
    () {
      getUsersUsecaseProviderTest = providerContainer.read(getUsersUsecaseProvider);
      addReviewUsecaseProviderTest = providerContainer.read(addReviewUsecaseProvider);
      getMovieDetailsUsecaseProviderTest = providerContainer.read(getMovieDetailsUsecaseProvider);
      removeMovieReviewUsecaseProviderTest = providerContainer.read(removeMovieReviewUsecaseProvider);
      getMoviesListUsecaseProviderTest = providerContainer.read(getMoviesListUsecaseProvider);
    },
  );
  test('getUsersUsecaseProvider is a GetUsersUsecase', () {
    expect(
      getUsersUsecaseProviderTest,
      isA<GetUsersUsecase>(),
    );
  });
  test('addReviewUsecaseProvider is a AddMovieReviewUsecase', () {
    expect(
      addReviewUsecaseProviderTest,
      isA<AddMovieReviewUsecase>(),
    );
  });
  test('getMovieDetailsUsecaseProvider is a GetMovieDetailsUsecase', () {
    expect(
      getMovieDetailsUsecaseProviderTest,
      isA<GetMovieDetailsUsecase>(),
    );
  });
  test('removeMovieReviewUsecaseProvider is a RemoveMovieReviewUsecase', () {
    expect(
      removeMovieReviewUsecaseProviderTest,
      isA<RemoveMovieReviewUsecase>(),
    );
  });
  test('getMoviesListUsecaseProvider is a GetMovieListUsecase', () {
    expect(
      getMoviesListUsecaseProviderTest,
      isA<GetMovieListUsecase>(),
    );
  });
}
