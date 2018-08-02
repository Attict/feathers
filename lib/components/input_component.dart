part of feathers;

class InputComponent extends Component {
  Map<Event, Function> events;

  InputComponent() {
    events = new Map<Event, Function>();
  }

  @override
  void init() {}

  @override
  void destroy() {}

  @override
  void load() {}

  @override
  void unload() {}

  @override
  void input(Event event) {
    /// If event.type matches any of the events.type
    /// and the event is within the bounds of position & size
    /// trigger callback
    PositionComponent position = quill.getComponent<PositionComponent>();
    SizeComponent size = quill.getComponent<SizeComponent>();

    for (Event e in events.keys) {
      if (event.type == e.type) {
        if (position == null && size == null) {
          events[e]();
        }
        if (position.x <= event.position.x &&
            event.position.x <= position.x + size.width &&
            position.y <= event.position.y &&
            event.position.y <= position.y + size.height) {
          events[e]();
        }
      }
    }
  }

  @override
  void update(Time time) {}

  @override
  void render(Context context) {}

  void addEvent(Event event, Function callback) {
    events[event] = callback;
  }
}
