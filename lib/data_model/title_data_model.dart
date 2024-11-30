class TitleDataModel {
  String? english;
  String? native;

  TitleDataModel({
    this.english,
    this.native,
  });

  TitleDataModel.fromJson(Map<String, dynamic> json) {
    english = json['english'];
    native = json['native'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['english'] = english;
    data['native'] = native;
    return data;
  }
}
