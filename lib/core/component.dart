part of feather;

abstract class Component {
    Quill quill;
    void setQuill(Quill quill) => this.quill = quill;

    void init();
    void destroy();
    void load();
    void unload();
    void input(Event event);
    void update(Time time);
    void render(Context context);
}
