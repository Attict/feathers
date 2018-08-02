part of feathers;

/// This is the game time, that will give up elapsed seconds,
/// total time, and other things

class Time {
  Duration duration;

  Time(this.duration);

  static Duration fromSeconds(double seconds) {
    /// TODO: Calculate the microseconds from seconds
    int mseconds = seconds.ceil();
    return new Duration(microseconds: mseconds);
  }

  double totalSeconds() {
    return duration.inMilliseconds * 1000.0;
  }

  double elapsedSeconds() {
    return duration.inMicroseconds / Duration.microsecondsPerSecond;
  }
}
