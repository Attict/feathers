part of feather;

/// Things to do with this component:
/// ...add color support
/// ...add blending support

class TextureComponent extends Component {
  Rect source;
  Texture texture;

  TextureComponent(this.texture, {this.source}) {
    if (source == null) {
      source = Rect.fromLTWH(0.0, 0.0, 50.0, 50.0);

      /// TODO: Make this the size of the image
    }
  }

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

      if (position == null || size == null) {
        print(
            "FEATHER: The TextureComponent requires the PositionComponent and SizeComponent!");
        position = new PositionComponent(x: 0.0, y: 0.0);
        size = new SizeComponent(
            width: 50.0,
            height: 50.0); // TODO: Fixme to be the size of the image
      }

      var destination =
          new Rect.fromLTWH(position.x, position.y, size.width, size.height);
      var paint = new Paint()..color = const Color(0xFFFFFFFF);

      context.canvas.drawImageRect(texture.image, source, destination, paint);
    }
  }
}
