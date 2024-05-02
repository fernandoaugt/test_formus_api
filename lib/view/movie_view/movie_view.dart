import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_formus_api/helper/base_api.dart';
import 'package:test_formus_api/helper/constants.dart';

class Movieview extends StatelessWidget {
  Movieview({super.key});
  final movie = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Constants.fontColor),
        title: Text(
          movie.title,
          style: TextStyle(color: Constants.fontColor),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            NetworkImage("${BaseApi.img}/${movie.posterPath}"),
                        fit: BoxFit.cover)),
              ),
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        stops: const [
                          0.7,
                          1.5,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF000000).withOpacity(0.32),
                          const Color(0xFF1A1A1D)
                        ])),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                      color: Constants.fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
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
                const SizedBox(
                  height: 16,
                ),
                Text(
                  movie.overview,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Constants.suportFontColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        ...List.generate(
                          double.parse(movie.voteAverage.toString()).truncate(),
                          (index) => const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Votos: ${movie.voteCount}",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Constants.suportFontColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
