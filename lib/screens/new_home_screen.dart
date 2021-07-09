import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tiktok_clone/screens/data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:tiktok_clone/screens/play_screen.dart';

class NewHome extends StatefulWidget {
  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  List<DataModel> data = List<DataModel>();

  getDataFromSheet() async {
    var raw = await http.get(
        'https://script.google.com/macros/s/AKfycbwu6L8V_wC0kyBzWaIuFjrx9dx8qRskCvz0TmUGccnpWi40fCo/exec');

    var jsonData = convert.jsonDecode(raw.body);
    jsonData.forEach((element) {
      DataModel dataModel = new DataModel();
      dataModel.videoUrl = element['video_url'];
      data.add(dataModel);
    });
  }

  @override
  void initState() {
    getDataFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Swiper(
              itemCount: data.length,
              duration: 2,
              scrollDirection: Axis.vertical,
              // autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return PlayScreen(
                  src: data[index].videoUrl,
                );
              }),
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
