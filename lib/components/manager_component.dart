part of feathers;

/// Does the manager component only allow for 1 active feather at a time?
/// perhaps have a separate component for multiple active feathers

class ManagerComponent extends Component {
  /// If this is set, then only ONE feather will be displayed
  String currentFeather;

  ManagerComponent();

  @override
  void init() {}

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
  void render(Context context) {}

  void enable(String name) {
    quill.feather.feathers[name].enabled = true;
  }

  void disable(String name) {
    quill.feather.feathers[name].enabled = false;
  }

  /// This will disable all feathers not matching `name`
  void singleEnable(String name) {
    for (String key in quill.feather.feathers.keys) {
      quill.feather.feathers[key].enabled = key == name;
    }
  }

  void setCurrent(String name) {
    if (quill.feather.feathers[name] == null) {
      print('FEATHER: This feather does not contain a feather named "$name"!');
      return;
    }
    if (currentFeather != name) {
      currentFeather = name;
      singleEnable(name);
    }
  }

  String getCurrent() {
    return currentFeather;
  }
}
