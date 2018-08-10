import 'package:feathers/feathers.dart';

import 'dart:ui';
import 'dart:math';

void main() async {
  FeatherEngine engine = new FeatherEngine();
  engine.initialize(new MyGame());
}

class MyGame extends Feather {
  Timer timer;

  /// For most things, we can handle everything inside of the init function
  /// ...but if you need to do something very specific during any other cycle
  /// ...such as load/unload/input/update/render, you have access to override
  /// ...those as well

  @override
  void init() {
    /// Add our scenes as part of `MyGame`
    addFeather('splash_scene', new SplashScene());
    addFeather('my_scene', new MyScene());

    /// Add a `ManagerComponent` to `MyGame`
    addComponent<ManagerComponent>(new ManagerComponent())
      ..setCurrent('splash_scene');

    /// Setup a timer for showing the 'splash_scene', then change to
    /// the 'my_scene' scene after 3 seconds.
    timer = new Timer(3.0);

    /// Always call `super` at the end of any override
    super.init();
  }

  @override
  void update(Time time) {
    if (timer != null && timer.completed(time)) {
      getComponent<ManagerComponent>().setCurrent('my_scene');
      timer = null;
    }

    super.update(time);
  }
}

class SplashScene extends Feather {
  @override
  void init() {
    /// This demonstrates using a feather without a preset `Quill`
    /// alternatively we could use the `SpriteQuill` to define our splash_image
    Feather splashImage = createFeather('splash_image');
    splashImage.addComponent<SizeComponent>(new SizeComponent())
      ..setSize(150.0, 150.0);
    splashImage.addComponent<PositionComponent>(new PositionComponent())
      ..setPosition(100.0, 225.0);
    splashImage.addComponent<TextureComponent>(new TextureComponent())
      ..setTexture(new Texture('splash.png'))
      ..setSource(Rect.fromLTWH(0.0, 0.0, 350.0, 351.0));

    super.init();
  }
}

class MyScene extends Feather {
  int direction = 0;
  @override
  void init() {
    /// Give this scene a rectangle size from (0.0, 0.0) to (380.0, 700.0)
    addComponent<PositionComponent>(new PositionComponent())
      ..setPosition(0.0, 0.0);
    addComponent<SizeComponent>(new SizeComponent())
      ..setSize(Context.screen.width, Context.screen.height);

    InputComponent input =
        this.addComponent<InputComponent>(new InputComponent());
    input.addEvent(new Event(EventType.TOUCHDOWN), () {
      direction = Random().nextInt(3);
    });

    this.createFeather('user').setQuill<SpriteQuill>(new SpriteQuill())
      ..setSize(50.0, 50.0)
      ..setPosition(25.0, 25.0)
      ..initWithColor(const Color(0xFFFFFFFF));

    super.init();
  }

  @override
  void update(Time time) {
    PositionComponent position =
        getFeather('user').getComponent<PositionComponent>();
    double move = 20 * time.elapsedSeconds();
    switch (direction) {
      case 0:
        position.x += move;
        break;
      case 1:
        position.x -= move;
        break;
      case 2:
        position.y += move;
        break;
      case 3:
        position.y -= move;
        break;
    }

    if (position.x > 380) {
      position.x = -50.0;
    } else if (position.x < -50) {
      position.x = 380.0;
    }

    if (position.y > 700) {
      position.y = -50.0;
    } else if (position.y < -50) {
      position.y = 700.0;
    }
    getFeather('user')
        .getQuill<SpriteQuill>()
        .setPosition(position.x, position.y);

    super.update(time);
  }
}
