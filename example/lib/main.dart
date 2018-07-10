import 'package:feathers/engine.dart';

import './my_game.dart';
void main() async {
    FeatherEngine engine = new FeatherEngine();
    engine.initialize(new MyGame());
}
