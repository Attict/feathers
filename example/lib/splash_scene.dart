import 'package:feathers/engine.dart';
import 'dart:ui';

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
