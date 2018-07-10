import 'package:feathers/engine.dart';
import 'dart:ui';
import 'dart:math';

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
