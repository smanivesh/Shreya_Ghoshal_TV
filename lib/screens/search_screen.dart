import 'dart:ffi';
import 'package:tiktok_clone/screens/data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/ad_state.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:math';
import 'package:tiktok_clone/screens/play_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // BannerAd banner;
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final adState = Provider.of<AdState>(context);
  //   adState.initialization.then((status) {
  //     setState(() {
  //       banner = BannerAd(
  //         adUnitId: adState.BannerAdUnitId,
  //         size: AdSize.banner,
  //         request: AdRequest(),
  //         listener: BannerAdListener(),
  //       )..load();
  //     });
  //   });
  // }
  ///............................................................above codes are for ads

  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.all(12.0),
  //     child: Center(
  //       child: Container(
  //         child: Column(
  //           children: [
  //             Text(
  //               'Entertaining Ads',
  //               style: TextStyle(fontSize: 40),
  //             ),

  //             if (banner == null)
  //               SizedBox(
  //                 height: 50,
  //               ),

  //             //  else
  //             // Container(height: 50, child: AdWidget(ad: ad: banner),)
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
    return PlayScreen(src: data[index].movieVideoUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Swiper(
              itemCount: data.length,
              duration: 15000,
              scrollDirection: Axis.vertical,
              autoplay: false,
              itemBuilder: (BuildContext context, int index) {
                index = generateRandomIndex();
                return PlayScreen(
                  src: data[index].movieVideoUrl,
                );
              }),
        ),
      ),
    );
  }
}

class DataTile extends StatelessWidget {
  final String movieVideoUrl;
  DataTile({this.movieVideoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
