part of feathers;

class SpriteQuill extends Quill {
  double x, y, width, height;

  SpriteQuill() : super();

  @override
  void init() {
    addComponent<PositionComponent>(new PositionComponent(x: x, y: y));
    addComponent<SizeComponent>(
        new SizeComponent(width: width, height: height));

    super.init();
  }

  @override
  void update(Time time) {
    PositionComponent position = getComponent<PositionComponent>();
    SizeComponent size = getComponent<SizeComponent>();

    position.x = this.x;
    position.y = this.y;
    size.width = this.width;
    size.height = this.height;

    super.update(time);
  }

  void initWithColor(Color color) {
    if (hasComponent<ColorComponent>()) {
      print(
          'FEATHER: The TextureComponent on this quill has already been set!');
      return;
    }
    addComponent<ColorComponent>(new ColorComponent(color));
  }

  void initWithTexture(Texture texture, {Rect source}) {
    if (hasComponent<TextureComponent>()) {
      print(
          'FEATHER: The TextureComponent on this quill has already been set!');
      return;
    }
    if (source == null) {
      source = Rect.fromLTWH(0.0, 0.0, width, height);
    }
    addComponent<TextureComponent>(
        new TextureComponent(texture, source: source));
  }

  void initWithAnimation(Animation animation) {
    AnimationComponent animationComponent = new AnimationComponent()
      ..addAnimation('main', animation);
    addComponent<AnimationComponent>(animationComponent);
  }

  void initWithAnimations(List<Animation> animations) {}

  void setPosition(double x, double y) {
    this.x = x;
    this.y = y;
  }

  void setSize(double width, double height) {
    this.width = width;
    this.height = height;
  }

  void addEvent(Event event, Function callback) {}
}
