import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework_movies/app/home/bloc/movies_bloc.dart';
import 'package:wework_movies/app/home/bloc/movies_events.dart';
import 'package:wework_movies/app/home/bloc/movies_state.dart';
import 'package:wework_movies/app/widgets/app_bar.dart';
import 'package:wework_movies/app/widgets/app_card.dart';
import 'package:wework_movies/app/widgets/app_error_widget.dart';
import 'package:wework_movies/app/widgets/app_loader.dart';
import 'package:wework_movies/app/widgets/app_search_bar.dart';
import 'package:wework_movies/app/widgets/app_section.dart';
import 'package:wework_movies/app/widgets/now_playing_card.dart';
import 'package:wework_movies/app/widgets/top_rated_card.dart';
import 'package:wework_movies/utils/themes/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TopRatedMoviesBloc>().add(const TopRatedEvent());
      context.read<MoviesBloc>().add(const NowPlayingEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.black,
            ),
            label: 'We Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Upcoming',
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          width: screenSize.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: appGradientBg,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 6.0),
                  // * AppBar
                  const AppBarWidget(),
                  const SizedBox(height: 10.0),
                  // * Search Bar
                  const AppSearchField(
                    hint: 'Search Movies by name...',
                  ),
                  // * Card
                  InkWell(
                    onTap: () {},
                    child: const AppCard(),
                  ),
                  // * Now Playing Section
                  const AppSection(title: 'NOW PLAYING'),
                  // * Now Playing List
                  BlocConsumer<MoviesBloc, MoviesState>(
                    builder: (context, state) {
                      if (state is NowPlayingLoadingState) {
                        return const AppLoader();
                      }
                      if (state is NowPlayingErrorState) {
                        return const AppErrorWidget();
                      }
                      if (state is NowPlayingMoviesState) {
                        return SizedBox(
                          height: screenSize.height * 0.40,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: state.nowPlaying.results
                                .map(
                                  (e) => NowPlayingCard(
                                    data: e,
                                  ),
                                )
                                .toList(),
                          ),
                        );

                        // return SizedBox(
                        //   height: screenSize.height * 0.40,
                        //   child: ListView(
                        //     scrollDirection: Axis.horizontal,
                        //     children: [1, 2, 3, 4, 5]
                        //         .map(
                        //           (e) => const NowPlayingCard(),
                        //         )
                        //         .toList(),
                        //   ),
                        // );
                      }

                      return const Text('Testing.....');
                    },
                    listener: (context, movieState) {},
                  ),

                  const SizedBox(height: 30.0),
                  const AppSection(title: 'TOP RATED'),
                  BlocConsumer<TopRatedMoviesBloc, MoviesState>(
                    builder: (context, state) {
                      log(state.runtimeType.toString());
                      if (state is TopRatedLoadingState) {
                        return const AppLoader();
                      }
                      if (state is TopRatedErrorState) {
                        return const AppErrorWidget();
                      }
                      if (state is TopRatedMoviesState) {
                        return ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const TopRatedCard();
                          },
                        );
                      }

                      return const Text('Testing.....');
                    },
                    listener: (context, movieState) {},
                  ),

                  const SizedBox(height: 20.0)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
