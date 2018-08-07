# Feathers

A lightweight game engine, that only uses feathers.

## Quick Start

**lib/main.dart**
```
import 'package:feathers/feathers.dart';
import 'dart:ui'

void main() async {
  FeatherEngine engine = new FeatherEngine();
  engine.initialize(new MyGame());
}

class MyGame extends Feather {
  @override
  void init() {
    this.addFeather('usersprite', new User());
    super.init();
  }
}

class User extends Feather {
  @override
  void init() {
    this.setQuill<SpriteQuill>(new SpriteQuill())
      ..setSize(50.0, 150.0)
      ..setPosition(25.0, 50.0)
      ..initWithColor(0xFFFF0000);
    super.init();
  }
}
```
## Feather Loops

The main loop consists of these methods:

`init`: Initializes the feather/component.

`destroy`: Disposes of the feather/component, and all internal properties.

`load`: Loads any data neccessary for the feather/component.

`unload`: Unloads any data, to make room for loading new data.

`input`: Handles input events as neccessary for the feather/component.

`update`: Updates our feather/component.

`render`: Draws our feather/component to the screen.

## Contributing

_Coming soon..._
