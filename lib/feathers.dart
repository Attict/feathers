library feathers;

import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

part 'core/animation.dart';
part 'core/audio.dart';
part 'core/component.dart';
part 'core/context.dart';
part 'core/event.dart';
part 'core/feather.dart';
part 'core/quill.dart';
part 'core/texture.dart';
part 'core/time.dart';
part 'core/timer.dart';

part 'components/action_component.dart';
part 'components/animation_component.dart';
part 'components/color_component.dart';
part 'components/input_component.dart';
part 'components/manager_component.dart';
part 'components/position_component.dart';
part 'components/size_component.dart';
part 'components/sound_component.dart';
part 'components/text_component.dart';
part 'components/texture_component.dart';
part 'components/timer_component.dart';

part 'quills/camera_quill.dart';
part 'quills/label_quill.dart';
part 'quills/sprite_quill.dart';

/// This is where the game engine initializes from the main
/// function call
class FeatherEngine {
  /// The game iteself is just a feather
  Feather game;

  /// Last update used for calculating the delta time
  Duration lastUpdate;

  /// Time is our delta time
  Time time;

  /// Input timer delays input so that input
  /// has a chance to get called, rather than overriding each
  Timer inputTimer;

  FeatherEngine();

  /// Initializes the entire app in this call
  /// this is where everything starts.
  void initialize(Feather game) {
    /// Set the screen size
    Context.screen = (window.physicalSize / window.devicePixelRatio);

    // game.size = window.physicalSize / window.devicePixelRatio;
    this.game = game;
    game.init();
    inputTimer = new Timer(0.025);

    /// [?] Does this need moved?
    game.load();

    /// Handle input
    window.onPointerDataPacket = this.handleInput;

    /// Begin rendering
    window.onBeginFrame = this.run;
    window.scheduleFrame();
  }

  /// The application loop
  void run(Duration timeStamp) {
    final Rect paintBounds = Offset.zero & Context.screen;
    final PictureRecorder recorder = new PictureRecorder();
    final Canvas canvas = new Canvas(recorder, paintBounds);
    //canvas.translate(paintBounds.width / 2.0, paintBounds.height / 2.0);

    /// [Update]
    if (lastUpdate == null) {
      lastUpdate = timeStamp;
    }
    Duration delta = lastUpdate - timeStamp;
    lastUpdate = timeStamp;
    time = new Time(delta);
    game.update(time);

    /// [Render]
    Context context = new Context(canvas);
    game.render(context);

    final Picture picture = recorder.endRecording();
    // COMPOSITE
    final double devicePixelRatio = window.devicePixelRatio;
    final Float64List deviceTransform = new Float64List(16)
      ..[0] = devicePixelRatio
      ..[5] = devicePixelRatio
      ..[10] = 1.0
      ..[15] = 1.0;
    final SceneBuilder sceneBuilder = new SceneBuilder()
      ..pushTransform(deviceTransform)
      ..addPicture(Offset.zero, picture)
      ..pop();
    window.render(sceneBuilder.build());

    // After rendering the current frame of the animation, we ask the engine to
    // schedule another frame. The engine will call beginFrame again when its time
    // to produce the next frame.
    window.scheduleFrame();
  }

  /// [Input]
  void handleInput(PointerDataPacket packet) {
    for (PointerData datum in packet.data) {
      if (inputTimer.completed(time)) {
        Event event;
        if (datum.change == PointerChange.down) {
          event = new Event(EventType.TOUCHDOWN)
            ..setPosition(datum.physicalX, datum.physicalY);
        } else if (datum.change == PointerChange.up) {
          event = new Event(EventType.TOUCHUP)
            ..setPosition(datum.physicalX, datum.physicalY);
        }
        if (event != null) {
          game.input(event);
        }
      }

      // if current

    }
  }
}
