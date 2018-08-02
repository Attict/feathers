part of feathers;

class Texture {
  String filename;
  Image image;
  Texture(this.filename);
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
