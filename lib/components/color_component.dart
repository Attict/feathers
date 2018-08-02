part of feathers;

class ColorComponent extends Component {
  Paint paint;

  ColorComponent(Color color) {
    paint = new Paint()..color = color;
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
  void input(Event event) {}

  @override
  void update(Time time) {}

  @override
  void render(Context context) {
    PositionComponent position = (hasComponent<PositionComponent>())
        ? getComponent<PositionComponent>()
        : addComponent<PositionComponent>(
            new PositionComponent(x: 0.0, y: 0.0));
    SizeComponent size = (hasComponent<PositionComponent>())
        ? getComponent<SizeComponent>()
        : addComponent<SizeComponent>(
            new SizeComponent(width: 50.0, height: 50.0));

    Rect rect =
        new Rect.fromLTWH(position.x, position.y, size.width, size.height);
    context.canvas.drawRect(rect, paint);
  }
}
