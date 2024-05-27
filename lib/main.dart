import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework_movies/app/app.dart';
import 'package:wework_movies/app/home/bloc/movies_bloc.dart';
import 'package:wework_movies/app/home/intro_screen.dart';
import 'package:wework_movies/utils/themes/text_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesBloc>(
          create: (context) => MoviesBloc(),
        ),
        BlocProvider<TopRatedMoviesBloc>(
          create: (context) => TopRatedMoviesBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Wework Movies',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Helvetica',
          textTheme: appTextTheme,
          useMaterial3: false,
        ),
        home: const App(),
      ),
    );
  }
}
