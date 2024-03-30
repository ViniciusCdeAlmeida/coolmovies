class MovieQueries {
  static String getMovies() => r"""
  query AllMovies {
    allMovies {
      nodes {
        id
        title
        imgUrl
      }
    }
  }
      """;

  static String getUsers() => '''
  query {
    allUsers {
      nodes {
        id
        name
        nodeId
      }
    }
      ''';

  static String getMovieDetails({
    required String id,
  }) =>
      '''
  query {
    movieById(id: $id) {
      imgUrl
      id
      releaseDate
      title
    }
  }
      ''';

  static String addMovieReviews({
    required String title,
    required String userId,
    required String movieId,
    int rating = 1,
    String body = '',
  }) =>
      '''
  mutation {
    createMovieReview(
      input: {
        movieReview: {
        title: $title,
        movieId: $movieId,
        userReviewerId: $userId,
        rating: $rating,
        body: $body,
        }
      }
    ) {
      clientMutationId
    }
  }
      ''';
}
