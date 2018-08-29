part of feathers;

class Audio {
  static AudioCache audioCache = new AudioCache(prefix: 'audio/');

  String filename;

  /// Creates the audio track by filename
  Audio(this.filename);

  /// Loads the audio track during [load]
  Future<Null> load() async {
      
  }

  /// Starts the audio track
  void play() {
  }

  /// Stops and resets the audio track
  void stop() {}

  /// Pauses the audio track at the current time
  void pause() {}

  /// Resumes without new parameters
  void resume() {}

  /// Restarts the audio track to 0.0
  void restart() {}

  /// Sets the time to specific time, use milliseconds
  void seek(int ms) {
  }
}
