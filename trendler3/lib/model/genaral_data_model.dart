class GenaralDataModel {
  String link;
  String title;
  String extra;

  GenaralDataModel({this.link, this.title, this.extra});

  GenaralDataModel.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    title = json['title'];
    extra = json['extra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['title'] = this.title;
    data['extra'] = this.extra;
    return data;
  }
}
