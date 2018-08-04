library feathers;

import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

part 'core/animation.dart';
part 'core/component.dart';
part 'core/context.dart';
part 'core/event.dart';
part 'core/feather.dart';
part 'core/quill.dart';
part 'core/texture.dart';
part 'core/time.dart';
part 'core/timer.dart';

part 'components/animation_component.dart';
part 'components/color_component.dart';
part 'components/input_component.dart';
part 'components/manager_component.dart';
part 'components/position_component.dart';
part 'components/size_component.dart';
part 'components/text_component.dart';
part 'components/texture_component.dart';
part 'components/tween_component.dart';

part 'quills/label_quill.dart';
part 'quills/sprite_quill.dart';

class FeatherEngine {
  Feather game;
  Duration lastUpdate;
  Time time;

  Timer inputTimer;

  FeatherEngine();

  void initialize(Feather game) {
    // Set the screen size
    Context.screen = (window.physicalSize / window.devicePixelRatio);

    // game.size = window.physicalSize / window.devicePixelRatio;
    this.game = game;
    game.init();
    inputTimer = new Timer(0.025);


    /// [?] Does this need moved?
    game.load();

    window.onPointerDataPacket = this.handleInput;
    window.onBeginFrame = this.run;
    window.scheduleFrame();
  }

  void run(Duration timeStamp) {
    final Rect paintBounds =
        Offset.zero & (window.physicalSize / window.devicePixelRatio);
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
