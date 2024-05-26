import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework_movies/app/home/bloc/movies_events.dart';
import 'package:wework_movies/app/home/bloc/movies_state.dart';
import 'package:wework_movies/app/home/network/network_service.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final NetworkService networkService = NetworkService();

  MoviesBloc() : super(MoviesInitialState()) {
    on<NowPlayingEvent>((event, emit) async {
      emit(NowPlayingLoadingState());
      await Future.delayed(const Duration(seconds: 4));
      try {
        final res = await networkService.getNowPlayingMovies();
        emit(NowPlayingMoviesState(nowPlaying: res));
      } catch (e) {
        emit(NowPlayingErrorState());
      }
    });

    on<TopRatedEvent>((event, emit) async {
      emit(TopRatedLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      try {
        final res = await networkService.getTopRatedMovies();
        emit(TopRatedMoviesState(topRated: res));
      } catch (e) {
        emit(TopRatedErrorState());
      }
    });
  }
}

class TopRatedMoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final NetworkService networkService = NetworkService();

  TopRatedMoviesBloc() : super(MoviesInitialState()) {
    on<TopRatedEvent>((event, emit) async {
      emit(TopRatedLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      try {
        final res = await networkService.getTopRatedMovies();
        emit(TopRatedMoviesState(topRated: res));
      } catch (e) {
        emit(TopRatedErrorState());
      }
    });
  }
}
