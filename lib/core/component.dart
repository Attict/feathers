part of feathers;

abstract class Component {
  Quill quill;
  void setQuill(Quill quill) => this.quill = quill;

  T addComponent<T extends Component>(T component) {
    return quill.addComponent<T>(component);
  }

  T removeComponent<T extends Component>() {
    return quill.removeComponent<T>();
  }

  bool hasComponent<T extends Component>() {
    return quill.hasComponent<T>();
  }

  T getComponent<T extends Component>() {
    return quill.getComponent<T>();
  }

  void init();
  void destroy();
  void load();
  void unload();
  void input(Event event);
  void update(Time time);
  void render(Context context);
}
