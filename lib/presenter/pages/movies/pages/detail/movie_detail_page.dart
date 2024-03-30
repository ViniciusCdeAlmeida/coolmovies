import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider/movie_detail_provider.dart';

class MovieDetailPage extends ConsumerStatefulWidget {
  final String movieId;
  final String title;

  const MovieDetailPage({
    super.key,
    required this.movieId,
    required this.title,
  });

  @override
  ConsumerState<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends ConsumerState<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(movieDetailNotifierProvider(widget.movieId));
    return Scaffold(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            elevation: 4.0,
            forceElevated: true,
          ),
          SliverFillRemaining(
            child: state.when(
              init: () => const SizedBox.shrink(),
              loading: () => const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
              success: (movie) => ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                  horizontal: 15,
                ),
                children: [
                  const Text(
                    'Reviews',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFF063971),
                    ),
                  ),
                  ...movie.movieReviews.map(
                    (e) => Card(
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.title,
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              e.body,
                              textAlign: TextAlign.justify,
                            ),
                            Wrap(
                              children: [
                                const Text('Rating: '),
                                ...List.generate(
                                  e.count,
                                  (index) => const Icon(Icons.star),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              error: (exception) => const Center(
                child: Text('That\'s an error'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
