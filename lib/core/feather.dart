part of feathers;

/// The main class of feathers, this class is each and every
/// node of our application.
/// Each feather has a single [Quill] attached to it, by default
/// this quill is empty (with no components attached).
/// [Quill]'s have presets, such as the [SpriteQuill].
/// If you don't wish to use a preset, you can attach [Components]
/// individually.

class Feather {
  /// Enabled determines whether or not the feather is
  /// looped and rendered.
  bool enabled = true;

  /// The [Quill] is a set of components or a preset of components
  /// that help this feather be more interactable.
  Quill quill;

  /// Each feather consists of a subset of feathers.
  Map<String, Feather> feathers;

  /// Create the feather with an empty quill
  /// use the [setQuill] method to use a preset
  Feather() {
    setQuill(new Quill());
    feathers = new Map<String, Feather>();
  }

  /// Intialize the quill and each sub-feather
  void init() {
    quill.init();
    for (Feather feather in feathers.values) {
      feather.init();
    }
  }

  /// Destroy the quill and each sub-feather
  /// as well as the map of sub-feathers
  void destroy() {
    quill.destroy();
    for (Feather feather in feathers.values) {
      feather.destroy();
    }
    feathers = null;
  }

  /// Load the quill, and each sub-feather
  void load() {
    quill.load();
    for (Feather feather in feathers.values) {
      feather.load();
    }
  }

  /// Unload the quill and each sub-feather
  void unload() {
    quill.unload();
    for (Feather feather in feathers.values) {
      feather.unload();
    }
  }

  /// Handle input for the quill, and each
  /// enabled sub-feather.
  void input(Event event) {
    quill.input(event);
    for (Feather feather in feathers.values) {
      if (feather.enabled) {
        feather.input(event);
      }
    }
  }

  /// Update the quill and each sub-feather
  /// that is enabled.
  void update(Time time) {
    quill.update(time);
    for (Feather feather in feathers.values) {
      if (feather.enabled) {
        feather.update(time);
      }
    }
  }

  /// Render the quill, and each enabled
  /// sub-feather
  void render(Context context) {
    quill.render(context);
    for (Feather feather in feathers.values) {
      if (feather.enabled) {
        feather.render(context);
      }
    }
  }

  ////////////////////////////////////////////////
  /// [Quill] and [Component] Management Below ///
  ////////////////////////////////////////////////

  /// Add a Component of generic type that
  /// extends [Component], then return
  /// the component, for usage.
  T addComponent<T extends Component>(T component) {
    quill.addComponent<T>(component);
    return component;
  }

  /// Remove a component of generic type that
  /// extends [Component]
  void removeComponent<T extends Component>() {
    quill.removeComponent<T>();
  }

  /// Check whether a component exists by generic
  /// type that extends [Component] and return [true|false]
  bool hasComponent<T extends Component>() {
    return quill.hasComponent<T>();
  }

  /// Get an existing component by type extends [Component]
  T getComponent<T extends Component>() {
    return quill.getComponent<T>();
  }

  /// Get the current Quill by type extends [Quill]
  T getQuill<T extends Quill>() {
    return this.quill;
  }

  /// Set the quill to a preset quill of type extends
  /// [Quill], by also providing an instance of the [Quill].
  /// TODO: Plans to remove the required instance of the quill
  /// so that it can create the instance in this method.  In
  /// the case that happens, replace the param, with optional param.
  T setQuill<T extends Quill>(T quill) {
    quill.setFeather(this);
    this.quill = quill;
    return this.quill;
  }

  //////////////////////////////////
  /// [Feather] Management Below ///
  //////////////////////////////////

  /// Create a feather by name only, without providing a
  /// specified feather.
  Feather createFeather(String name) {
    return addFeather(name, new Feather());
  }

  /// Create a feather by name, and feather.  You can also
  /// use unique feathers/subclasses of feather if you've
  /// created your own class that extends feather.
  Feather addFeather(String name, Feather feather) {
    if (feathers[name] != null) {
      print(
          'FEATHER: A feather named "$name" already exists inside of this feather!');
      return feathers[name];
    }
    feathers[name] = feather;
    return feather;
  }

  /// Remove the sub-feather by name.
  void removeFeather(String name) {
    if (feathers[name] != null) {
      feathers.remove(name);
    }
  }

  /// Return the feather by name.
  Feather getFeather(String name) {
    if (feathers[name] == null) {
      print(
          'FEATHER: There are no feathers named "$name" inside of this feather!');
      return null;
    }
    return feathers[name];
  }

  /// Change a feather by name, to the new given feather.
  void setFeather(String name, Feather feather) {
    if (feathers[name] == null) {
      print(
          'FEATHER: There are no feathers named "$name" inside of this feather!');
      return;
    }
    feathers[name] = feather;
  }

  /// Return the complete map of feathers.
  Map<String, Feather> listFeathers({String search, int maxlength}) {
    return feathers;
  }
}
