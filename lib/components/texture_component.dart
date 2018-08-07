part of feathers;

/// Things to do with this component:
/// ...add color support
/// ...add blending support

class TextureComponent extends Component {
  Rect source;
  Texture texture;

  @override
  void init() {}

  @override
  void destroy() {}

  @override
  void load() {
    texture.load();
  }

  @override
  void unload() {}

  @override
  void input(Event event) {}

  @override
  void update(Time time) {}

  @override
  void render(Context context) {
    if (texture.image != null) {
      PositionComponent position = quill.getComponent<PositionComponent>();
      SizeComponent size = quill.getComponent<SizeComponent>();

      /// TODO: Add getComponent to return 0,0

      var destination =
          new Rect.fromLTWH(position.x, position.y, size.width, size.height);
      var paint = new Paint()..color = const Color(0xFFFFFFFF);

      context.canvas.drawImageRect(texture.image, source, destination, paint);
    }
  }

  void setSource(Rect source) {
    this.source = source;
  }

  void setTexture(Texture texture) {
    this.texture = texture;
  }
}
