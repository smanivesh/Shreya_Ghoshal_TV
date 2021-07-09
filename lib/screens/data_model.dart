class DataModel {
  String videoUrl;
//contructor
  DataModel({this.videoUrl});

  factory DataModel.fromJson(dynamic json) {
    return DataModel(
      videoUrl: "${json['video_url']}",
    );
  }
  Map toJson() => {
        "video_url": videoUrl,
      };
}
