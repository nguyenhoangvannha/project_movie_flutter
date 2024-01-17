class Video {
  final String id;
  final String key;
  final String name;
  final String site;
  final int size;
  final String type;

  Video({this.id, this.key, this.name, this.site, this.size, this.type});

  @override
  String toString() {
    return 'Video{id: $id, key: $key, name: $name, site: $site, size: $size, type: $type}';
  }
}
