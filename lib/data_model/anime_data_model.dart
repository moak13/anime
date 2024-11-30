import 'page_data_model.dart';

class AnimeDataModel {
  PageDataModel? page;

  AnimeDataModel({
    this.page,
  });

  AnimeDataModel.fromJson(Map<String, dynamic> json) {
    page = json['Page'] != null ? PageDataModel.fromJson(json['Page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (page != null) {
      data['Page'] = page!.toJson();
    }
    return data;
  }
}
