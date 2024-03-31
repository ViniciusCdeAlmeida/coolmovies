import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../domain/entities/movie_list_entity.dart';

class MovieListItemWidget extends StatelessWidget {
  final MovieListEntity movie;

  const MovieListItemWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: Text(
                  movie.title,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            if (movie.image != null)
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Image.network(
                  movie.image!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
      onTap: () {
        Modular.to.pushNamed(
          '/details/',
          arguments: {
            'movieId': movie.id,
            'title': movie.title,
          },
        );
      },
    );
  }
}
