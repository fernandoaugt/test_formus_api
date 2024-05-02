import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_formus_api/helper/base_api.dart';
import 'package:test_formus_api/helper/constants.dart';
import 'package:test_formus_api/helper/routes.dart';
import 'package:test_formus_api/models/movie_model.dart';

class MovieListTile extends StatelessWidget {
  const MovieListTile({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        child: SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(PagesRoutes.movieView, arguments: movie);
                },
                child: Container(
                  width: 120,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: NetworkImage(
                              "${BaseApi.img}/${movie.posterPath}"),
                          fit: BoxFit.fitWidth)),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                movie.title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
                style: TextStyle(
                    color: Constants.fontColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                movie.releaseDate.substring(0, 4),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
                style: TextStyle(
                    color: Constants.suportFontColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
