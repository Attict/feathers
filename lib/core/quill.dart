part of feathers;

class Quill {
  Feather feather;
  List<Component> components;

  Quill() {
    components = new List<Component>();
  }

  void init() {
    for (Component component in components) {
      component.init();
    }
  }

  void destroy() {
    for (Component component in components) {
      component.destroy();
    }
    components = null;
  }

  void load() {
    for (Component component in components) {
      component.load();
    }
  }

  void unload() {
    for (Component component in components) {
      component.unload();
    }
  }

  void input(Event event) {
    for (Component component in components) {
      component.input(event);
    }
  }

  void update(Time time) {
    for (Component component in components) {
      component.update(time);
    }
  }

  void render(Context context) {
    for (Component component in components) {
      component.render(context);
    }
  }

  T addComponent<T extends Component>(T component) {
    Component c = getComponent<T>();
    if (c != null) {
      print('FEATHER: Component ${T.toString()} already exists on this Quill!');
      return c;
    }
    component.setQuill(this);
    components.add(component);
    return component;
  }

  T removeComponent<T extends Component>() {
    Component component = getComponent<T>();
    if (component == null) {
      print(
          'FEATHER: Component ${T.toString()} does not exists on this Quill!');
      return null;
    }
    // component.unload();
    component.destroy();
    components.remove(component);
    return component;
  }

  bool hasComponent<T extends Component>() {
    for (Component component in components) {
      if (component is T) {
        return true;
      }
    }
    return false;
  }

  T getComponent<T extends Component>() {
    for (Component component in components) {
      if (component is T) {
        return component;
      }
    }
    return null;
  }

  void setFeather(Feather feather) {
    this.feather = feather;
  }
}
