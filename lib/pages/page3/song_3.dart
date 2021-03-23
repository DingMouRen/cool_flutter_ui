class Song3{
  String? name;
  String? singer;
  String? cover;
  PlayingState state = PlayingState.RESET;

  Song3(this.name, this.singer, this.cover);


}
enum PlayingState{PLAYING,STOP,RESET}
