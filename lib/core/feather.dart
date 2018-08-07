part of feathers;

class Feather {
  bool enabled = true;
  Quill quill;
  Map<String, Feather> feathers;

  Feather([Quill quill]) {
    if (quill == null) {
      setQuill(new Quill());
    } else {
      setQuill(quill);
    }
    feathers = new Map<String, Feather>();
  }

  void init() {
    quill.init();
    for (Feather feather in feathers.values) {
      feather.init();
    }
  }

  void destroy() {
    quill.destroy();
    for (Feather feather in feathers.values) {
      feather.destroy();
    }
    feathers = null;
  }

  void load() {
    quill.load();
    for (Feather feather in feathers.values) {
      feather.load();
    }
  }

  void unload() {
    quill.unload();
    for (Feather feather in feathers.values) {
      feather.unload();
    }
  }

  void input(Event event) {
    quill.input(event);
    for (Feather feather in feathers.values) {
      if (feather.enabled) {
        feather.input(event);
      }
    }
  }

  void update(Time time) {
    quill.update(time);
    for (Feather feather in feathers.values) {
      if (feather.enabled) {
        feather.update(time);
      }
    }
  }

  void render(Context context) {
    quill.render(context);
    for (Feather feather in feathers.values) {
      if (feather.enabled) {
        feather.render(context);
      }
    }
  }

  /// Manage Components through methods:
  /// add, remove, get, set, list

  T addComponent<T extends Component>(T component) {
    quill.addComponent<T>(component);
    return component;
  }

  void removeComponent<T extends Component>() {
    quill.removeComponent<T>();
  }

  bool hasComponent<T extends Component>() {
    return quill.hasComponent<T>();
  }

  T getComponent<T extends Component>() {
    return quill.getComponent<T>();
  }

  T getQuill<T extends Quill>() {
    return this.quill;
  }

  T setQuill<T extends Quill>(T quill) {
    quill.setFeather(this);
    this.quill = quill;
    return this.quill;
  }

  /// Manage Sub-Feathers of this feather:
  /// add, remove, get, set, list

  Feather createFeather(String name) {
    return addFeather(name, new Feather());
  }

  Feather addFeather(String name, Feather feather) {
    if (feathers[name] != null) {
      print(
          'FEATHER: A feather named "$name" already exists inside of this feather!');
      return null;
    }
    feathers[name] = feather;
    return feather;
  }

  void removeFeather(String name) {
    if (feathers[name] != null) {
      feathers.remove(name);
    }
  }

  Feather getFeather(String name) {
    if (feathers[name] == null) {
      print(
          'FEATHER: There are no feathers named "$name" inside of this feather!');
      return null;
    }
    return feathers[name];
  }

  void setFeather(String name, Feather feather) {
    if (feathers[name] == null) {
      print(
          'FEATHER: There are no feathers named "$name" inside of this feather!');
      return;
    }
    feathers[name] = feather;
  }

  Map<String, Feather> listFeathers({String search, int maxlength}) {
    return feathers;
  }
}
