import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // ignore: non_constant_identifier_names
  Material MyItems(
      IconData icon, String heading, String subheading, int color) {
    return Material(
      color: Colors.lime[50],
      elevation: 10.0,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(9.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //icon
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(50.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 15.0,
                      ),
                    ),
                  ),

                  //text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(color: new Color(color), fontSize: 10.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      subheading,
                      style: TextStyle(color: new Color(color), fontSize: 10.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
        children: <Widget>[
          MyItems(
            Icons.graphic_eq,
            "TotalViews",
            "jgj",
            0xff39691e,
          ),
          MyItems(Icons.smartphone, "Random cool stuff",
              "unexpected, random gem", 0xffed622b),
          MyItems(
            Icons.graphic_eq,
            "TotalViews",
            " gsgs",
            0xffed622b,
          ),
          MyItems(Icons.graphic_eq, "TotalViews", " fgfhdg", 0xff7297ff),
          MyItems(Icons.graphic_eq, "TotalViews", "hncd", 0xff7297ff),
          MyItems(Icons.graphic_eq, "richa", " ghgj", 0xffed622b),
          MyItems(Icons.graphic_eq, "manjul", "ghx", 0xffed622b),
          MyItems(Icons.graphic_eq, "mummy", "dgh", 0xffed622b),
          MyItems(Icons.graphic_eq, "papa", "fgh", 0xff7297ff),
          MyItems(Icons.graphic_eq, "kfj", "hggh", 0xff7297ff),
          MyItems(Icons.graphic_eq, "manivesh", "bh", 0xff39691e),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(2, 130.0),
        ],
      ),
    );
  }
}
