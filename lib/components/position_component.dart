part of feathers;

class PositionComponent extends Component {
  double x = 0.0, y = 0.0, offsetX = 0.0, 
      offsetY = 0.0, baseX = 0.0, baseY = 0.0;

  @override
  void init() {
    // TODO: implement init
  }

  @override
  void destroy() {
    // TODO: implement destroy
  }

  @override
  void load() {
    // TODO: implement load
  }

  @override
  void unload() {
    // TODO: implement unload
  }

  @override
  void input(Event event) {
    // TODO: implement input
  }

  @override
  void update(Time time) {
    // TODO: implement update
  }

  @override
  void render(Context context) {
    // TODO: implement render
  }

  void setPosition(double x, double y) {
    this.baseX = x;
    this.baseY = y;
    this.x = x - offsetX;
    this.y = y - offsetY;
  }

  void setOffset(double x, double y) {
    offsetX = x;
    offsetY = y;
    setPosition(this.baseX, this.baseY);
  }
}
