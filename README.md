# Feathers

A lightweight game engine, that only uses feathers.

## Why Feathers?

The idea of feathers is to give you full control over your app.  By allowing you 
to create the components you want, for the feathers you design.  All you need to 
know, is a feather!

## Quick Start

**lib/main.dart**
```dart
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
## The Feather Loop

Each feather, and all associated components follow a main way of looping. 
Primarily through the **input, update, and render** methods.

`init`: Initializes the feather/component.

`destroy`: Disposes of the feather/component, and all internal properties.

`load`: Loads any data neccessary for the feather/component.

`unload`: Unloads any data, to make room for loading new data.

`input`: Handles input events as neccessary for the feather/component.

`update`: Updates our feather/component.

`render`: Draws our feather/component to the screen.

## Custom Components & Quills

Creating custom components is simple.  Create a new file to hold your components, 
perhaps storing them in a **custom_components** directory. Add your class extending
the `Component` class, then implement the methods appropriatly (found above in the 
_Feather Loops_ section.   It is up to you to determine how you want your component 
to handle everything!  See example below:

```dart
class CustomComponent extends Component {
  @override
  void init() {
  }

  @override
  void destroy() {
  }

  @override
  void load() {
  }

  @override
  void input(Event event) {
  }

  @override
  void update(Time time) {
  }

  @override
  void render(Context context) {
  }
}
```

### Quills

Create quills is similar to creating components, except you do not need to implement the
core loop functionality, since this is already handled for you.  The main focus of your
custom quill is to add whichever components  you wish to have combined into one component
set.  See example below:

```dart
class ColoredSquareQuill extends Quill {
  void initWithColor(Color color) {
    addComponent<PositionComponent>(new PositionComponent())
      ..setPosition(25.0, 50.0);

    addComponent<SizeComponent>(new SizeComponent())
      ..setSize(75.0, 75.0);

    addComponent<ColorComponent>(new ColorComponent())
      ..setColor(color);
  }
}
```

**NOTE: Quill overrides require calling the super method at the end**

### Creating Consistent Components and Quills

* Components should not contain constructors, to keep things simple.  This will help keep 
your code maintainable.  _Future versions plan to remove adding access to constructors._ 
* Quills should init with a unique method, such as `initWithColor`, rather than using the
`init` override.  Again, this helps keep code more maintainable.

## Contributing

I hope that one day there will be a community of components and quills to help new users 
streamline their app development.

_More Coming soon..._
