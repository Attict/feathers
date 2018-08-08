part of feathers;

/// The Quill class contains all components attached to any given
/// [Feather].  You can create your own preset [Quill]s by extending
/// this class, or you can simply attach components on to the default
/// quill provided in each [Feather].

class Quill {
  /// The feather which this quill is attached to.
  Feather feather;

  /// The list of components inside of this quill.
  List<Component> components;

  /// Initialize the list of components.
  Quill() {
    components = new List<Component>();
  }

  /// Initialize each component.
  void init() {
    for (Component component in components) {
      component.init();
    }
  }

  /// Destroy each component.
  void destroy() {
    for (Component component in components) {
      component.destroy();
    }
    components = null;
  }

  /// Load each component.
  void load() {
    for (Component component in components) {
      component.load();
    }
  }

  /// Unload each component.
  void unload() {
    for (Component component in components) {
      component.unload();
    }
  }

  /// Handle input for each component.
  void input(Event event) {
    for (Component component in components) {
      component.input(event);
    }
  }

  /// Update each component.
  void update(Time time) {
    for (Component component in components) {
      component.update(time);
    }
  }

  /// Render each component.
  void render(Context context) {
    for (Component component in components) {
      component.render(context);
    }
  }

  /// Add a component by generic type extends [Component]
  /// Also, assert that the component does not already exist,
  /// if it does, return the existing component.
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

  /// Remove component by generic type extends [Component].
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

  /// Return whether the component already exists by generic
  /// type extends [Component].
  bool hasComponent<T extends Component>() {
    for (Component component in components) {
      if (component is T) {
        return true;
      }
    }
    return false;
  }

  /// Get component by generic type extends [Component].
  T getComponent<T extends Component>() {
    for (Component component in components) {
      if (component is T) {
        return component;
      }
    }
    return null;
  }

  /// Set the feather that this quill is attached to.
  void setFeather(Feather feather) {
    this.feather = feather;
  }
}
