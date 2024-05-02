import 'package:flutter/material.dart';
import 'package:test_formus_api/models/movie_model.dart';

class MovieListTile extends StatelessWidget {
  const MovieListTile({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.red),
    );
  }
}
