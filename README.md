# Feathers

A Flutter package for creating flexible, and light mobile apps and games!  _More info coming soon..._

**Feather is still in an (early) development release**

## Feathering Your App

Feather uses a _node_ based approach to everything.  Everything is a feather (node), every feather has a quill (set of components).  Quills may be predefined, such as the `SpriteQuill`, or you can customize them to contain only the `Components` you really want!  _This documentation is lacking, but will be updated as soon as possible..._

## Quick Start

First we can create a feather

`this.addFeather('user_sprite', new Feather());`

Then we can add a couple components for functionality to our feather

```
Feather user = this.getFeather('user_sprite');
user.addComponent<PositionComponent>(new PositionComponent(x: 25.0, y: 25.0));
user.addComponent<SizeComponent>(new SizeComponent(width: 50.0, height: 100.0));
user.addComponent<TextureComponent>(new TextureComponent(new Texture('user.png'));
```

Alternatively we can use a preset quill, such as the sprite quill for this:

```
Feather user = this.getFeather('user_sprite');
user.setQuill<SpriteQuill>()
  ..setPosition(x: 25.0, y: 25.0)
  ..setSize(width: 50.0, height: 100.0)
  ..initWithTexture(new Texture('user.png');
```

## Usage

_Example coming soon..._

**lib/main.dart**
```
import 'package:feathers/feathers.dart';

import './my_game.dart';

void main() async {
    FeatherEngine engine = new FeatherEngine();
    engine.initialize(new MyGame());
}
```

**lib/my_game.dart**
```
import 'package:feathers/feathers.dart';

class MyGame extends Feather {

    /// For most things, we can handle everything inside of the init function
    /// but you also have access to the other overrides listed below in the "Loop" section

    @override
    void init() {
        Feather sprite = createFeather('user_sprite')
            ..addComponent<SizeComponent>(new SizeComponent(width: 50.0, height:150.0)
            ..addComponent<PositionComponent>(new PositionComponent(x: 25.0, y: 225.0));

        sprite.addComponent<TextureComponent>(
            new TextureComponent(
                new Texture('image.png'),
                source: Rect.fromLTWH(0.0, 0.0, 500.0, 150.0)
            )
        );

        /// Assign a width and height for use on the following sprite
        double width = 25.0;
        double height = 25.0;

        /// Prepare the animation, by using `createFrames` method
        /// ..which automatically creates by (duration, startFrame, endFrame, sourceWidth, sourceHeight)
        /// ..optionally set the direction to TEETER back and forth in this case
        Texture animatedSpriteTexture = new Texture('spritesheet.png');
        Animation animatedSpriteAnimation = new Animation(spriteWithPresetTexture)
            ..createFrames(0.1, 0, 5, width, height, direction: AnimationOptions.TEETER);

        Feather animatedSprite = createFeather(
            'animated_sprite',
            quill: new SpriteQuill(x: 150.0, y: 50.0, width: 25.0, height: 25.0)
        );
        animatedSprite.getQuill<SpriteQuill>()
            ..setSize(35.0, 35.0)
            ..setPosition(250.0, 50.0)
            ..initWithAnimation(animatedSpriteAnimation);

        /// super method calls should ALWAYS come at the end
        super.init();
    }
    
}
```

add to **pubspec.yaml**

_also make sure the image is in the corresponding directory_

```
flutter:
    assets:
        - assets/images/image.png
        - assets/images/spritesheet.png
```

## Loop

The main loop consists of these methods:

`init`: Initializes the feather/component.

`destroy`: Disposes of the feather/component, and all internal properties.

`load`: Loads any data neccessary for the feather/component.

`unlaod`: Unloads any data, to make room for loading new data.

`input`: Handles input events as neccessary for the feather/component.

`update`: Updates our feather/component.

`render`: Draws our feather/component to the screen.

## Creating Feathers

When you create/add a feather, you can also directly access the feather.

E.g. `Feather myFeather = createFeather('my_feather');`

## Contributing

_Coming soon..._
