import 'package:feathers/engine.dart';

import './splash_scene.dart';
import './my_scene.dart';

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
