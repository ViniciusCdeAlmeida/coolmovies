import 'package:coolmovies/presenter/pages/movies/pages/list/provider/movie_provider.dart';
import 'package:coolmovies/presenter/pages/movies/widgets/movie_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesListPage extends ConsumerStatefulWidget {
  const MoviesListPage({
    super.key,
  });

  @override
  ConsumerState<MoviesListPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends ConsumerState<MoviesListPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(movieNotifierProvider);
    return Scaffold(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Movies'),
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
              success: (data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => MovieListItemWidget(movie: data[index]),
              ),
              error: (exception) => const Center(
                child: Text('That\'s an error'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
