part of feathers;

class ColorComponent extends Component {
  Paint paint;

  @override
  void init() {
    paint = new Paint();
  }

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
    PositionComponent position = getComponent<PositionComponent>();
    SizeComponent size = getComponent<SizeComponent>();

    Rect rect =
        new Rect.fromLTWH(position.x, position.y, size.width, size.height);
    context.canvas.drawRect(rect, paint);
  }

  void setColor(Color color) {
    this.paint.color = color;
  }
}
