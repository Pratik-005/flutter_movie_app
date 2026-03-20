import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class MovieInfo extends StatelessWidget {
  final Map<String, dynamic> movie;
  const MovieInfo({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.indigo,
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    height: 250,
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500${movie['backdrop_path']}",
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    bottom: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: ModifiedText(
                        size: 16,
                        text: '⭐ Average Rating ( ${movie['vote_average']} )',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ModifiedText(
                  size: 22,
                  text:
                      movie['name'] ?? movie['title'] ?? movie['original_name'],
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ModifiedText(
                  size: 14,
                  text:
                      "Release Date - ${movie['first_air_date'] ?? movie['release_date']}",
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Flexible(
                  child: ModifiedText(
                    color: Colors.grey,
                    size: 14,
                    text: movie['overview'],
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
