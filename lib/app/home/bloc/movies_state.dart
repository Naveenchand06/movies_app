import 'package:wework_movies/app/home/models/now_playing_movies.dart';
import 'package:wework_movies/app/home/models/top_rated_movies.dart';

abstract class MoviesState {}

// * Initial State
class MoviesInitialState extends MoviesState {}

// * Loading State
class NowPlayingLoadingState extends MoviesState {}

class TopRatedLoadingState extends MoviesState {}

// * Error State
class NowPlayingErrorState extends MoviesState {}

class TopRatedErrorState extends MoviesState {}

// * Success State

class NowPlayingMoviesState extends MoviesState {
  final NowPlayingMovies nowPlaying;

  NowPlayingMoviesState({
    required this.nowPlaying,
  });
}

class TopRatedMoviesState extends MoviesState {
  final TopRatedMovies topRated;

  TopRatedMoviesState({
    required this.topRated,
  });
}
