part of feathers;

class Audio {
  String filename;

  /// Creates the audio track by filename
  Audio(this.filename);

  /// Loads the audio track during [load]
  Future<Null> load() async {}

  /// Starts the audio track
  void play() {}

  /// Stops and resets the audio track
  void stop() {}

  /// Pauses the audio track at the current time
  void pause() {}

  /// Restarts the audio track to 0.0
  void restart() {}

  /// Sets the time to specific time
  void setTime() {}
}
