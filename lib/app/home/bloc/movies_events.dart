abstract class MoviesEvent {
  const MoviesEvent();
}

class NowPlayingEvent extends MoviesEvent {
  const NowPlayingEvent();
}

class TopRatedEvent extends MoviesEvent {
  const TopRatedEvent();
}
