import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/entities/movie_detail_entity.dart';
import 'provider/movie_add_review_provider.dart';

class MovieAddReviewPage extends ConsumerStatefulWidget {
  final MovieDetailEntity movie;

  const MovieAddReviewPage({
    super.key,
    required this.movie,
  });

  @override
  ConsumerState<MovieAddReviewPage> createState() => _MovieAddReviewPageState();
}

class _MovieAddReviewPageState extends ConsumerState<MovieAddReviewPage> {
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(movieAddReviewNotifierProvider(widget.movie).notifier);
    final state = ref.watch(movieAddReviewNotifierProvider(widget.movie));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 16,
          top: 24,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: notifier.formKey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: notifier.title,
                    maxLength: 20,
                    onChanged: (value) => notifier.title = value,
                    // validator: (_) => _viewModel.validateTitle(),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.edit),
                      labelText: 'Title',
                      helperText: 'Required',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: notifier.body,
                    maxLength: 500,
                    onChanged: (value) => notifier.body = value,
                    maxLines: 3,
                    // validator: (_) => _viewModel.validateDescription(),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.view_headline),
                      labelText: 'Review',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: notifier.title,
                    maxLength: 2,
                    onChanged: (value) => notifier.title = value,
                    // validator: (_) => _viewModel.validateDescription(),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.star),
                      labelText: 'Rating',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final currentState = notifier.formKey.currentState;
                    if (currentState != null && currentState.validate()) {
                      notifier.addReviewMovie(widget.movie.id);
                    }
                  },
                  child: state.maybeWhen(
                    loading: () => const SizedBox(
                      height: 50.0,
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      ),
                    ),
                    orElse: () => const Text('Save'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
