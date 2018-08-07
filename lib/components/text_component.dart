part of feathers;

enum TextOptions {
  DIRECTION_LTR,
  DIRECTION_RTL,
  ALIGN_LEFT,
  ALIGN_CENTER,
  ALIGN_RIGHT,
  ALIGN_JUSTIFY,
  STYLE_ITALIC,
  STYLE_BOLD,
  STYLE_UNDERLINE
}

class TextComponent extends Component {
  Paragraph paragraph;
  TextStyle textStyle;
  String text;

  @override
  void init() {
    final TextStyle style =
        new TextStyle(color: const Color(0xFFFF0000), fontSize: 16.0);
    final ParagraphConstraints constraints =
        new ParagraphConstraints(width: 200.0);
    format(style, constraints);
  }

  @override
  void destroy() {}

  @override
  void load() {}

  @override
  void unload() {}

  @override
  void input(Event event) {}

  @override
  void update(Time time) {}

  @override
  void render(Context context) {
    PositionComponent position = quill.getComponent<PositionComponent>();
    context.canvas
        .drawParagraph(this.paragraph, new Offset(position.x, position.y));
  }

  void format(TextStyle style, ParagraphConstraints constraints,
      {TextDirection direction}) {
    //final ParagraphBuilder builder = new ParagraphBuilder(new ParagraphStyle(textDirection: TextDirection.ltr))
    //    ..pushStyle(new TextStyle(color: const Color(0xFF0000FF)))
    //    ..addText('Hello, ')
    //    ..pushStyle(new TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold))
    //    ..addText('world. ')
    //    ..pop()
    //    ..addText('Standard style.');

    //paragraph = builder.build()
    //    ..layout(new ParagraphConstraints(width: 200.0));

    if (direction == null) {
      direction = TextDirection.ltr;
    }
    final ParagraphBuilder builder =
        new ParagraphBuilder(new ParagraphStyle(textDirection: direction))
          ..pushStyle(style)
          ..addText(text);

    paragraph = builder.build()..layout(constraints);
  }

  void setText(String text) {
    this.text = text;
  }
}
