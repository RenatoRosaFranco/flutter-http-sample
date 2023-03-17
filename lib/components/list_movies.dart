import 'package:flutter/material.dart';
import 'package:sample/components/movie_card.dart';
import 'package:sample/models/movie.dart';

class ListMovies extends StatelessWidget {
  const ListMovies({Key? key, required this.movies}) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 4
      ),
      itemCount: movies.length,
      itemBuilder: ((context, index) {
        final movie = movies[index];

        return MovieCard(
          name: movie.name,
          image: movie.image
        );
      }),
    );
  }
}
