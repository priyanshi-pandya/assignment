class ImageDataFromPexel {
  List<Photos>? photos;

  ImageDataFromPexel(
      {this.photos});

  ImageDataFromPexel.fromJson(Map<String, dynamic> json) {
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photos {
  Src? src;
  Photos(
      {
        this.src,
      });

  Photos.fromJson(Map<String, dynamic> json) {
    src = json['src'] != null ? Src.fromJson(json['src']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (src != null) {
      data['src'] = src!.toJson();
    }
    return data;
  }
}

class Src {
  String? medium;
  String? small;
  Src(
      { this.medium,
        this.small,
      });

  Src.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    small = json['small'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medium'] = medium;
    data['small'] = small;
    return data;
  }
}