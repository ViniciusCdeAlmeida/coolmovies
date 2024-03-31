
# Coolmovies

In this project I'm gonna show some movies, details and reviews about movies. There you can read reviews, add or remove your reviews.

## Authors

- [@ViniciusCdeAlmeida](https://www.github.com/ViniciusCdeAlmeida)

## GraphQL API

### Show All Movies

```http
query AllMovies {
    allMovies {
      nodes {
        id
        title
        imgUrl
      }
    }
  }
```

#### Show Movie

```http
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
```

| Param   | Type       | Description                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id`      | `string` | **Required**. The ID to show details about a movie |

#### Add review

```http
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
```

| Param   | Type       | Description                                   |
| :---------- | :--------- | :------------------------------------------ |
| `title`      | `string` | **Not Required**. The Title to add in new movie review |
| `body`      | `string` | **Not Required**. The Body to add in new movie review |
| `userId`      | `string` | **Required**. The UserId who added a new movie review |
| `rating`      | `integer` | **Not Required**. The Rating to add in new movie review |
| `movieId`      | `string` | **Required**. The ID to add in movie review |

#### Remove review

```http
  mutation {
    deleteMovieReviewById(
      input: {
        id: "$reviewId"
      }
    ) {
    deletedMovieReviewId
    }
  }
```

| Param   | Type       | Description                                   |
| :---------- | :--------- | :------------------------------------------ |
| `reviewId`      | `string` | **Required**. The ReviewId to remove from movie review |

## Rodando localmente

Clone the project

```bash
  git clone git@github.com:ViniciusCdeAlmeida/coolmovies.git
```

Run pub get

```bash
  flutter pub get
```

Run the project

```bash
  flutter run
```

## Live

Insira um gif ou um link de alguma demonstração

## Feedback

If anyone wants to send a feedback, please send an email to <viniciusc.almeida1@gmail.com> or conctact me in linkedin [Vinicius Correa de Almeida](https://www.linkedin.com/in/viniciuscorrea-almeida/).
