import 'package:flutter/material.dart';
import 'package:movie_app/movie_info.dart';
import 'package:movie_app/utils/text.dart';

class TopRated extends StatelessWidget {
  final List movies;
  const TopRated({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    movies[0].forEach((key, value) {
      print("$key : $value");
    });

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Top Rated Movies', size: 20),
          Container(
            height: 280,
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieInfo(movie: movies[index])));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500${movies[index]['poster_path']}",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: ModifiedText(
                            size: 13,
                            text: movies[index]['title'] ?? 'Loading...',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
