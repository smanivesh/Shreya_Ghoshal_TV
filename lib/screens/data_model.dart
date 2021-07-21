class DataModel {
  String videoUrl;
  String movieVideoUrl;
//contructor
  DataModel({this.videoUrl, this.movieVideoUrl});

  factory DataModel.fromJson(dynamic json) {
    return DataModel(
      videoUrl: "${json['video_url']}",
      movieVideoUrl: "${json['movie_video_url']}",
    );
  }
  Map toJson() => {
        "video_url": videoUrl,
        "movie_video_url": movieVideoUrl,
      };
}
