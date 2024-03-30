import 'package:coolmovies/domain/usecases/add_movie_review_usecase.dart';
import 'package:coolmovies/domain/usecases/get_movie_details_usecase.dart';
import 'package:coolmovies/domain/usecases/get_movie_list_usecase.dart';
import 'package:coolmovies/domain/usecases/get_users_usecase.dart';
import 'package:coolmovies/domain/usecases/remove_movie_review_usecase.dart';
import 'package:coolmovies/infra/repositories/movie_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getUsersUsecaseProvider = Provider<GetUsersUsecase>((ref) {
  return GetUsersUsecase(movieRepository: ref.read(movieRepositoryProvider));
});

final addReviewUsecaseProvider = Provider<AddMovieReviewUsecase>((ref) {
  return AddMovieReviewUsecase(movieRepository: ref.read(movieRepositoryProvider));
});

final getMoviesListUsecaseProvider = Provider<GetMovieListUsecase>((ref) {
  return GetMovieListUsecase(movieRepository: ref.read(movieRepositoryProvider));
});

final getMovieDetailsUsecaseProvider = Provider<GetMovieDetailsUsecase>((ref) {
  return GetMovieDetailsUsecase(movieRepository: ref.read(movieRepositoryProvider));
});

final removeMovieReviewUsecaseProvider = Provider<RemoveMovieReviewUsecase>((ref) {
  return RemoveMovieReviewUsecase(movieRepository: ref.read(movieRepositoryProvider));
});
