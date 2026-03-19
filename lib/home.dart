import 'package:flutter/material.dart';
import 'package:movie_app/widgets/top_rated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv_shows.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apiKey = 'e4a4eadcad23dc4c0874b3c10fea2b62';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNGE0ZWFkY2FkMjNkYzRjMDg3NGIzYzEwZmVhMmI2MiIsIm5iZiI6MTc3MzE2ODM4Ny4zMDIsInN1YiI6IjY5YjA2NzAzZThjNzQ2YzQyNDU3NzI4YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.l92IlpSe7beiNupd9QvksmNLqFvRaJLVjQFYuimN3Sw';

  List trendingmovies = [];
  List topratedmovies = [];
  List tvshows = [];

  void loadData() async {
    final tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readaccesstoken),
      logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true),
    );

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingResult['results'];
      topratedmovies = topResult['results'];
      tvshows = tvResult['results'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.movie, size: 30),
        title: Text('Movies App'),
        titleSpacing: 0,
        backgroundColor: const Color.fromARGB(255, 73, 6, 35),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 20),
            TrendingMovies(movies: trendingmovies),
            TopRated(movies: topratedmovies),
            TvShows(movies: tvshows),
          ],
        ),
      ),
    );
  }
}
