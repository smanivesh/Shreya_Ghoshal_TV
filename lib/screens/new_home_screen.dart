import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tiktok_clone/screens/data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:math';
import 'package:tiktok_clone/screens/play_screen.dart';

class NewHome extends StatefulWidget {
  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  List<DataModel> data = List<DataModel>();
  void randIndexList(index) {
    var randIndex = new List(data.length);
    randIndex[i] = index;
    i++;
    for (int a = 0; a < data.length; a++) {
      print(randIndex[i]);
    }
  }

  int i = 0;

  getDataFromSheet() async {
    var raw = await http.get(
        'https://script.google.com/macros/s/AKfycbwu6L8V_wC0kyBzWaIuFjrx9dx8qRskCvz0TmUGccnpWi40fCo/exec');

    var jsonData = convert.jsonDecode(raw.body);
    List<DataModel> tempData = List<DataModel>();
    jsonData.forEach((element) {
      DataModel dataModel = new DataModel();
      dataModel.videoUrl = element['video_url'];
      dataModel.movieVideoUrl = element['movie_video_url'];
      tempData.add(dataModel);
    });
    setState(() {
      data = tempData;
    });
  }

  @override
  void initState() {
    getDataFromSheet();
    super.initState();
  }

  //@override
  //void next(){bool animation: true}

  int generateRandomIndex() {
    var random = new Random();
    int index = random.nextInt(data.length);
    randIndexList(index);
    return index;
  }

  //function to change to next video. Function is called from youtube Meta data, onend youtube+player.dart
  PlayScreen changeNextVideo() {
    int index = generateRandomIndex();
    return PlayScreen(src: data[index].videoUrl);
  }

  SwiperController controller = new SwiperController();
  void onVideoEnd(data) {
    print('NEW_HOME_SCREEN:: Video ended, Next video');
    controller.next();
  }

  @override
  Widget build(BuildContext context) {
    int length = data.length;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: length > 0
              ? Swiper(
                  itemCount: length,
                  duration: 500,
                  scrollDirection: Axis.vertical,
                  autoplay: false,
                  controller: controller,
                  itemBuilder: (BuildContext context, int index) {
                    index = generateRandomIndex();
                    return PlayScreen(
                        src: data[index].videoUrl, onEnd: onVideoEnd);
                  })
              : null,
        ),
      ),
    );
  }
}

class DataTile extends StatelessWidget {
  final String videoUrl;
  DataTile({this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
