part of feathers;

class Texture {
  /// Make sure the file name is also included inside of the
  /// pubspec.yaml file
  String filename;

  /// The image itself
  Image image;

  /// Create the texture by filename
  Texture(this.filename);

  /// Loads the texture during [load]
  Future<Null> load() async {
    if (image == null) {
      ByteData data = await rootBundle.load('assets/images/$filename');
      Uint8List bytes = new Uint8List.view(data.buffer);
      Completer<Image> completer = new Completer();
      decodeImageFromList(bytes, (image) => completer.complete(image));
      this.image = await completer.future;
    }
  }
}
