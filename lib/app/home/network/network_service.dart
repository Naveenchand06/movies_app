import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wework_movies/app/home/models/now_playing_movies.dart';
import 'package:wework_movies/app/home/models/top_rated_movies.dart';

class NetworkService {
  final Dio _dio = Dio(
    BaseOptions(headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YTg3ZTY4MDMyODIwMTIzZmQ0Yzg0YjQzNDhjYjc3ZCIsInN1YiI6IjY2Mjg5NDExOTFmMGVhMDE0YjAwOWU1ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6zIM73Giwg5M4wP6MX8KDCpee7IMnpnLTZUyMpETb08"
    }),
  );

  Future<NowPlayingMovies> getNowPlayingMovies() async {
    try {
      Response res = await _dio.get(
          'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1');
      log(res.data.toString());
      return NowPlayingMovies.fromJson(res.data);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<TopRatedMovies> getTopRatedMovies() async {
    try {
      Response res = await _dio.get(
          'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1');
      // log(res.data.toString());
      return TopRatedMovies.fromJson(res.data);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}