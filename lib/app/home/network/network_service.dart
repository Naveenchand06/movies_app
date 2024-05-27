import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wework_movies/app/home/models/now_playing_movies.dart';
import 'package:wework_movies/app/home/models/top_rated_movies.dart';

class NetworkService {
  final Dio _dio = Dio(
    BaseOptions(headers: {"Authorization": "Bearer <YOUR TMDB Token>"}),
  );

  Future<NowPlayingMovies> getNowPlayingMovies() async {
    try {
      Response res = await _dio.get(
          'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1');
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
      return TopRatedMovies.fromJson(res.data);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
