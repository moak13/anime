import 'media_data_model.dart';

class PageDataModel {
  List<MediaDataModel>? medias;

  PageDataModel({
    this.medias,
  });

  PageDataModel.fromJson(Map<String, dynamic> json) {
    if (json['media'] != null) {
      medias = <MediaDataModel>[];
      json['media'].forEach((v) {
        medias!.add(MediaDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (medias != null) {
      data['media'] = medias!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
