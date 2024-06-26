void main() {

  Media media = Media();
  media.play();


  Song song = Song('Taylor Swift');
  song.play();
}


class Media {
  void play() {
    print('Playing media...');
  }
}


class Song extends Media {
  String artist;

  Song(this.artist);

  @override
  void play() {
    print('Playing song by $artist...');
  }
}
