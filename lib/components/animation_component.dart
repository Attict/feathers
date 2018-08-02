part of feathers;

class AnimationComponent extends Component {
  Map<String, Animation> animations;
  String current;

  AnimationComponent() {
    animations = new Map<String, Animation>();
  }

  @override
  void init() {}

  @override
  void destroy() {}

  @override
  void load() {
    for (Animation animation in animations.values) {
      animation.load();
    }
  }

  @override
  void unload() {}

  @override
  void input(Event event) {}

  @override
  void update(Time time) {
    if (animations[current] != null) {
      animations[current].update(time);
    }
  }

  @override
  void render(Context context) {
    if (animations[current] != null &&
        animations[current].texture.image != null) {
      PositionComponent position = quill.getComponent<PositionComponent>();
      SizeComponent size = quill.getComponent<SizeComponent>();
      Rect destination =
          new Rect.fromLTWH(position.x, position.y, size.width, size.height);
      Paint paint = new Paint()..color = const Color(0xFFFFFFFF);

      context.canvas.drawImageRect(animations[current].texture.image,
          animations[current].currentFrame(), destination, paint);
    }
  }

  void addAnimation(String name, Animation animation) {
    if (animations[name] != null) {
      print('FEATHER: Animation $name already exists!');
      return;
    }
    if (current == null) {
      current = name;
    }
    animations[name] = animation;
  }

  void removeAnimation(String name) {
    animations.remove(name);
  }

  void setAnimation(String name) {
    current = name;
  }

  void addFrame(String animationName, AnimationFrame frame) {}
}
