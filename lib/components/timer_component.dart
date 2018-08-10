part of feathers;

class TimerComponent extends Component {
  Map<String, Timer> timers;

  @override
  void init() {}

  @override
  void destroy() {}

  @override
  void load() {}

  @override
  void unload() {}

  @override
  void input(Event event) {}

  @override
  void update(Time time) {}

  @override
  void render(Context context) {}

  void addTimer(String name, Timer timer) {
    timers[name] = timer;
  }

  void removeTimer(String name) {
    timers[name] = null;
  }
}
