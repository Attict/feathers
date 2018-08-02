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
        createFeather('splash_image')
            ..addComponent<SizeComponent>(new SizeComponent(width: 150.0, height: 150.0))
            ..addComponent<PositionComponent>(new PositionComponent(x: 100.0, y: 225.0))
            ..addComponent<TextureComponent>(new TextureComponent(new Texture('splash.png'), 
                        source: Rect.fromLTWH(0.0, 0.0, 350.0, 351.0)));

        super.init();
    }
}

class MyScene extends Feather {
    int direction = 0;
    @override
    void init() {
        /// Give this scene a rectangle size from (0.0, 0.0) to (380.0, 700.0)
        this
            ..addComponent<PositionComponent>(new PositionComponent(x: 0.0, y: 0.0))
            ..addComponent<SizeComponent>(new SizeComponent(width: 380.0, height: 700.0));

        InputComponent input = this.addComponent<InputComponent>(new InputComponent());
        input.addEvent(new Event(EventType.TOUCHDOWN), () {
            direction = Random().nextInt(3);
        });

        this.createFeather('user', quill: new SpriteQuill(
            x: 25.0,
            y: 25.0,
            width: 50.0,
            height: 50.0
        )).getQuill<SpriteQuill>()
            ..initWithColor(const Color(0xFF00FF00));

        super.init();
    }

    @override
    void update(Time time) {
        PositionComponent position = getFeather('user').getComponent<PositionComponent>();
        double move = 100 * time.elapsedSeconds();
        switch (direction) {
            case 0: position.x += move; break;
            case 1: position.x -= move; break;
            case 2: position.y += move; break;
            case 3: position.y -= move; break;
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
        getFeather('user').getQuill<SpriteQuill>().setPosition(position.x, position.y);

        super.update(time);
    }

}
