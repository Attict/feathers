part of feather;

class SpriteQuill extends Quill {
    double x, y, width, height;

    SpriteQuill({this.x, this.y, this.width, this.height}) : super();

    @override
    void init() {
        addComponent<PositionComponent>(new PositionComponent(x: x, y: y));
        addComponent<SizeComponent>(new SizeComponent(width: width, height: height));

        super.init();
    }

    @override
    void update(Time time) {
        PositionComponent position = getComponent<PositionComponent>();
        SizeComponent size = getComponent<SizeComponent>();

        position.x = this.x;
        position.y = this.y;
        size.width = this.width;
        size.height = this.height;

        super.update(time);
    }

    void initWithTexture(Texture texture, {Rect source}) {
        if (source == null) {
            source = Rect.fromLTWH(0.0, 0.0, width, height);
        }
        addComponent<TextureComponent>(new TextureComponent(texture, source: source));
    }

    void initWithAnimation(Animation animation) {
        AnimationComponent animationComponent = new AnimationComponent()
            ..addAnimation('main', animation);
        addComponent<AnimationComponent>(animationComponent);
    }

    void initWithAnimations(List<Animation> animations) {

        this.init();
    }

    void setPosition(double x, double y) {
        this.x = x;
        this.y = y;
    }

    void setSize(double width, double height) {
        this.width = width;
        this.height = height;
    }
}
