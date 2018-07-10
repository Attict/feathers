part of feather;

/// Timer class
class Timer {
    double increment = 0.0;
    double duration; // in seconds

    Timer(this.duration);

    bool completed(Time time) {
        increment += time.elapsedSeconds();
        if (increment >= duration) {
            return true;
        }
        return false;
    }

    void reset() {
        increment = 0.0;
    }
}
