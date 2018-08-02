part of feathers;

/// Event Types
/// Eventually we will have swipe, and double tap,
/// drag, etc.

enum EventType { TOUCHDOWN, TOUCHUP }

/// This is our event handler
class Event {
  EventType type;
  Point _position;
  Event(this.type);
  Point get position => this._position;
  set position(Point _position) => this._position = _position;
  void setPosition(double x, double y) {
    _position = new Point(x, y);
  }
}
