class MovieQueries {
  static String getMovies() => '''
  query AllMovies {
    allMovies {
      nodes {
        id
        title
        imgUrl
      }
    }
  }
      ''';

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
    movieById(id: "$id") {
      id
      imgUrl
      releaseDate
      title
      movieReviewsByMovieId {
        nodes {
          id
          body
          rating
          title
          userByUserReviewerId {
            name
            id
          }
        }
      }
    }
  }
       ''';

  static String addMovieReviews({
    required String title,
    required String userId,
    required String movieId,
    int rating = 0,
    String body = '',
  }) =>
      '''
  mutation {
    createMovieReview(
      input: {
        movieReview: {
        title: "$title",
        movieId: "$movieId",
        userReviewerId: "$userId",
        rating: $rating,
        body: "$body",
        }
      }
    ) {
      movieReview {
        title
        rating
        nodeId
        movieId
        id
        body
        userByUserReviewerId {
          name
          id
        }
      }
    }
  }
      ''';

  static String removeMovieReview({
    required String reviewId,
  }) =>
      '''
  mutation {
  deleteMovieReviewById(
    input: {
      id: "$reviewId"
    }
    ) {
    deletedMovieReviewId
  }
}
      ''';
}
