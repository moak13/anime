import 'title_data_model.dart';

class MediaDataModel {
  String? siteUrl;
  String? bannerImage;
  List<String>? genres;
  int? seasonYear;
  TitleDataModel? title;
  String? description;

  MediaDataModel({
    this.siteUrl,
    this.bannerImage,
    this.genres,
    this.seasonYear,
    this.title,
    this.description,
  });

  MediaDataModel.fromJson(Map<String, dynamic> json) {
    siteUrl = json['siteUrl'];
    bannerImage = json['bannerImage'];
    genres = json['genres'].cast<String>();
    seasonYear = json['seasonYear'];
    title =
        json['title'] != null ? TitleDataModel.fromJson(json['title']) : null;
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['siteUrl'] = siteUrl;
    data['bannerImage'] = bannerImage;
    data['genres'] = genres;
    data['seasonYear'] = seasonYear;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['description'] = description;
    return data;
  }
}
